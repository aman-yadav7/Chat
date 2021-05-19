from django.shortcuts import render
from rest_framework import generics

# Create your views here.
from chat import models
from .serializers import ChatSerializer

class ListChat(generics.ListCreateAPIView):
    queryset=models.Chat.objects.all()
    serializer_class=ChatSerializer

class DetailChat(generics.RetrieveUpdateDestroyAPIView):
    queryset=models.Chat.objects.all()
    serializer_class=ChatSerializer
