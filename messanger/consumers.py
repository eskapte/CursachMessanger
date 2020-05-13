import json
from channels.generic.websocket import AsyncWebsocketConsumer
from channels.db import database_sync_to_async
from django.contrib.auth.models import User
from .models import ChatMessage, Chat

class ChatConsumer(AsyncWebsocketConsumer):
    
    async def connect(self):
        """Подключение к веб-сокету"""
        # Получаем активные чаты пользователя
        self.username = self.scope['url_route']['kwargs']['username']
        # Получаем чаты пользователя
        self.user_chats = await self.get_chats(self.username)
        # Подключаемся к комнатам
        for chat in self.user_chats:
            try:
                await self.channel_layer.group_add(
                    f"chat_{chat}",
                    self.channel_name
                )
            except TypeError:
                pass
        
        # Разрешает подключение
        await self.accept()
    

    async def disconnect(self, close_code):
        # Отключение от всех комнат
        for chat in self.user_chats:
            await self.channel_layer.group_discard(
                f"chat_{chat}",
                self.channel_name
            )

        

    async def receive(self, text_data):
        """Получение сообщений из вебсокета"""
        data_json = json.loads(text_data)
        author = data_json['author']
        text = data_json['text']
        created = data_json['created']
        room_name = f"chat_{data_json['room'].replace(' ', '_._')}"

        await self.channel_layer.group_send(
            # В какой чат направить сообщение
            room_name,
            {
                'type': 'chat_message',
                'author': author,
                'text': text,
                'created': created,
                'room_name': room_name
            }
        )

        # Сохранение сообщения в бд
        await self.save_message(
            chat = await self.get_chat(data_json['room']),
            author = await self.get_user(username=author),
            text = text,
            created = created
        )

    async def chat_message(self, event):
        """Получение сообщения из группы"""
        author = event['author']
        text = event['text']
        created = event['created']
        room_name = event['room_name']

        print(self.channel_layer)
        
        await self.send(text_data=json.dumps({
            'author': author,
            'text': text,
            'created': created,
            'chat': room_name.replace('_._', ' ').split('_')[1],
        }))


    @database_sync_to_async
    def get_chats(self, username):
        """ Получение активных чатов юзера из бд """
        chats = []
        current_user = User.objects.get(username=username)
        for chat in current_user.chats.all():
            chats.append(chat.name.replace(' ', '_._'))
        return chats
        

    @database_sync_to_async
    def save_message(self, chat, author, text, created):
        data = ChatMessage.objects.create(
            chat = chat,
            author = author,
            text = text,
            created = created, 
        )
        data.save()
        data.is_readed.add(author)
        return True
    
    @database_sync_to_async
    def get_chat(self, name):
        return Chat.objects.get(name=name)
    

    @database_sync_to_async
    def get_user(self, username):
        return User.objects.get(username=username)