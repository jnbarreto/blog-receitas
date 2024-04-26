from django.urls import path
from .views import PostListView

urlpatterns = [
    path('api/posts/', PostListView.as_view()),  # Endpoint para listar postagens
]
