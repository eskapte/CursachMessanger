from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.forms import ModelForm
from .models import Profile
from django.forms.widgets import Select


class RegisterUserForm(UserCreationForm):

    class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name')
        labels = {
            'username': 'Уникальное имя пользователя',
            'email': 'Адрес эл.почты',
            'first_name': 'Ваше имя',
            'last_name': 'Ваша фамилия',    
        }


class EditUserForm(ModelForm):
    class Meta:
        model = User
        fields = ('username', 'email', 'first_name', 'last_name')
        labels = {
            'username': 'Уникальное имя пользователя',
            'email': 'Адрес эл.почты',
            'first_name': 'Ваше имя',
            'last_name': 'Ваша фамилия',    
        }

class EditUserProfile(ModelForm):
    class Meta:
        model = Profile
        fields = ('icon', 'status', 'role')
        labels = {
            'icon': 'Аватарка',
            'status': 'Установите статус',
            'role': 'Вы: '
        }
        widgets = {
            'role': Select()
        }