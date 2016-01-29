from django.apps import AppConfig


class OdontologyConfig(AppConfig):
    name = 'odontology'
    verbose_name = 'odontology Application'

    def ready(self):
        import odontology.signals
