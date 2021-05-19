from django.urls import path
from .views import ListChat,DetailChat

urlpatterns=[
    path('',ListChat.as_view()),
    path('<int:pk>/',DetailChat.as_view())
]

