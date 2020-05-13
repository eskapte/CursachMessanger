# Generated by Django 3.0.5 on 2020-04-27 22:07

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('messanger', '0002_chat_chatmessage'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='chatmessage',
            options={'ordering': ['-created'], 'verbose_name': 'Сообщение', 'verbose_name_plural': 'Сообщения'},
        ),
        migrations.RemoveField(
            model_name='chatmessage',
            name='text_html',
        ),
        migrations.AlterField(
            model_name='chat',
            name='name',
            field=models.CharField(max_length=50, verbose_name='Название чата'),
        ),
        migrations.AlterField(
            model_name='chat',
            name='users',
            field=models.ManyToManyField(related_name='chats', to=settings.AUTH_USER_MODEL, verbose_name='Участники чата'),
        ),
        migrations.AlterField(
            model_name='chatmessage',
            name='chat',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='messages', to='messanger.Chat'),
        ),
        migrations.AlterField(
            model_name='chatmessage',
            name='text',
            field=models.TextField(),
        ),
    ]