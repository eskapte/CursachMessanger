from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack
from django.urls import path
from messanger import consumers

application = ProtocolTypeRouter({
    # (http->django views is added by default)
    "websocket": AuthMiddlewareStack(
        URLRouter(
            [
                path('ws/chats/user/<str:username>/', consumers.ChatConsumer),
            ]
        )
    )
})