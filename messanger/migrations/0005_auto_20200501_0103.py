# Generated by Django 3.0.5 on 2020-04-30 22:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('messanger', '0004_auto_20200428_1856'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='chatmessage',
            options={'get_latest_by': ['created'], 'ordering': ['created'], 'verbose_name': 'Сообщение', 'verbose_name_plural': 'Сообщения'},
        ),
    ]
