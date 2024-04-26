from django.db import models
from django.utils import timezone

class Post(models.Model):
    title = models.CharField(max_length=255)  # Título do post
    content = models.TextField()  # Conteúdo do post
    created_at = models.DateTimeField(default=timezone.now)  # Data de criação

    def __str__(self):
        return self.title  # Retorna o título como representação de string
