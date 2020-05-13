from django.db import models
from django.contrib.auth.models import User


class Profile(models.Model):
    icon = models.ImageField(upload_to='messanger/images/', blank=True, null=True, verbose_name='Аватар', default='messanger/images/default_icon.jpg')
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    status = models.CharField(max_length=100, verbose_name='Статус', blank=True, null=True)

    ROLES = (
        ('Преподаватель', 'Преподаватель'),
        ('Учащийся', 'Учащийся')
    )

    role = models.CharField(max_length=30, choices=ROLES)
    
    class Meta:
        verbose_name = 'Профиль'
        verbose_name_plural = 'Профили'
    
    def __str__(self):
        return self.user.username


class Chat(models.Model):
    users = models.ManyToManyField(User, verbose_name="Участники чата", related_name='chats')
    name = models.CharField(max_length=50, verbose_name='Название чата')
    created = models.DateTimeField(auto_now_add=True, verbose_name='Создан')

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name = 'Чат'
        verbose_name_plural = 'Чаты'


class ChatMessage(models.Model):
    chat = models.ForeignKey(Chat, on_delete=models.CASCADE, related_name='messages')
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    text = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    # is_readed = models.BooleanField(default=False, verbose_name='Прочитано')
    is_readed = models.ManyToManyField(User, verbose_name='Прочитано', related_name='readed')


    def __str__(self):
        return self.text
    
    class Meta:
        verbose_name = 'Сообщение'
        verbose_name_plural = 'Сообщения'
        ordering = ['created']
        get_latest_by = ['created']