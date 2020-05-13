from django.urls import path, include
from . import views
from django.views.generic.base import RedirectView
from django.contrib.auth.views import LogoutView


urlpatterns = [
    path('', RedirectView.as_view(url='login', permanent=True), name='red_to_login'),
    path('chats/', views.Index.as_view(), name='main'),
    path('login/', views.UserLogin.as_view(), name='login'),
    path('register/', views.UserRegister.as_view(), name='register'),
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),
    path('profile/<str:username>/', views.UserProfile.as_view(), name='profile'),
    path('profile/<str:username>/edit', views.EditUserProfile.as_view(), name='edit')
]