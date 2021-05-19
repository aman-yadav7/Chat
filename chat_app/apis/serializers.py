from django.db.models import fields
from rest_framework import serializers
from chat import models

class ChatSerializer(serializers.ModelSerializer):
    class Meta:
        fields=(
            'sender',
            'message'
        )
        model=models.Chat