from django.apps import AppConfig


class MessangerConfig(AppConfig):
    name = 'messanger'

    def ready(self):
        import messanger.signals.handlers