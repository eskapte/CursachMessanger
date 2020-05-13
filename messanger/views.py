from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic.base import TemplateView
from django.contrib.auth.views import LoginView
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import DetailView
from .forms import RegisterUserForm, EditUserForm, EditUserProfile
from django.urls import reverse_lazy
from .models import Chat, Profile
from django.contrib.auth.models import User
from django.core import serializers
import json
from django.http import HttpResponse
import datetime
from datetime import datetime, date, time, timezone, timedelta
# Не авторизованные пользователи не имеют доступ
from django.contrib.auth.mixins import LoginRequiredMixin
from channels.layers import get_channel_layer
from asgiref.sync import async_to_sync


class UserLogin(LoginView):
    template_name = 'messanger/login.html'

    def get_redirect_url(self):
        self.next = super().get_redirect_url()
        if self.next:
            return self.next
        self.next = '/chats'
        return self.next


class Index(LoginRequiredMixin, TemplateView):
    template_name = 'messanger/main.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Получаем список чатов и кол-во непрочитанных сообщений
        chats = {}
        for chat in self.request.user.chats.all():
            chats[chat] = 0
            for msg in chat.messages.all():
               if not self.request.user in msg.is_readed.all():
                   chats[chat] += 1

        context['chats'] = chats
        return context
    
    def post(self, request, **args):
        if self.request.user.is_authenticated:
            if self.request.is_ajax():
                # Если пользователь перешёл в другой чат
                if self.request.POST.get('chat_name'):
                    chat_name = self.request.POST.get('chat_name')
                    # Получаем данные
                    selected_chat = Chat.objects.get(name=chat_name)
                    # Получение участников чата
                    participants = []
                    for participant in selected_chat.users.all():
                        participants.append(participant.username)
                    # Получение сообщений чата
                    messages = []
                    for msg in selected_chat.messages.all():
                        # Пользователь прочитал сообщение
                        if self.request.user.pk in msg.is_readed.all():
                            pass
                        else:
                            msg.is_readed.add(self.request.user.pk)
                        messages.append({
                            'author': msg.author.username,
                            'text': msg.text,
                            'created': (msg.created + timedelta(hours=3)).strftime("%d.%m.%Y %H:%M:%S") # Решаем проблему с часовым поясом,
                        })                                                                              # прибавляя + 3 часа к времени
                    # Создание словаря для отправки
                    data = {
                        'participants': participants,
                        'messages': messages,
                    }
                    return HttpResponse(json.dumps(data))
                # Получение при загрузке
                elif self.request.POST.get('get_connection'):
                    # Получение всех чатов пользователя
                    chats = self.request.user.chats.all()
                    data = []
                    for chat in chats:
                        data.append(chat.name)
                    return HttpResponse(json.dumps(data))
                # Приглашение пользователя в чат
                elif self.request.POST.get('add_user'):
                    try: 
                        username = self.request.POST.get('add_user')
                        chat_name = self.request.POST.get('chat')
                        user = User.objects.get(username=username)
                        chat = Chat.objects.get(name=chat_name)
                        chat.users.add(user)
                        return HttpResponse(username)
                    except:
                        return HttpResponse(json.dumps({'error': "doesn't exist the user!"}))
                # Создание нового чата
                elif self.request.POST.get('new_chat'):
                    try:
                        chat_name = self.request.POST.get('new_chat')
                        # Получаем канальный слой для создания комнаты
                        new_chat_name = chat_name.replace(' ', '_._')
                        channel_layer = get_channel_layer()
                        async_to_sync(channel_layer.group_add)(f"chat_{new_chat_name}", "default")

                        # Сохраняем в БД
                        new_chat = Chat.objects.create(name = chat_name)
                        new_chat.save()
                        new_chat.users.add(self.request.user)
                    # Если имя чата не валидно
                    except:
                        return HttpResponse(json.dumps({'error': 'invalid chat name'}))
                # Удаление чата
                elif self.request.POST.get('delete_chat'):
                    chat_name = self.request.POST.get('delete_chat')
                    user = self.request.user
                    chat = Chat.objects.get(name=chat_name)
                    chat.users.remove(user)

                    # Отключение от комнаты
                    new_chat_name = chat_name.replace(' ', '_._')
                    channel_layer = get_channel_layer()
                    async_to_sync(channel_layer.group_discard)(f"chat_{new_chat_name}", 'default')
            else:
                return super().post(request, **args)
        return redirect(reverse_lazy('login'))



class UserRegister(CreateView):
    template_name = 'messanger/registration.html'
    form_class = RegisterUserForm
    success_url = reverse_lazy('login')

    def get_success_url(self):
        Profile.objects.create(user=User.objects.get(username=self.request.POST.get('username')))
        return super().get_success_url()


class UserProfile(DetailView):
    model = User
    template_name = 'messanger/profile.html'

    def get_object(self):
        return get_object_or_404(User, username=self.kwargs['username'])


class EditUserProfile(UpdateView):
    template_name = 'messanger/edit_profile.html'
    model = User
    form_class = EditUserForm

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['profile_form'] = EditUserProfile
        return context

    def get_success_url(self):
        url = '/profile/%s' % self.request.user.username
        return url

    def get_object(self):
        return get_object_or_404(User, username=self.kwargs['username'])