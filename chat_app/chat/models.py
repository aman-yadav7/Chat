from django.db import models

# Create your models here.
class Chat(models.Model):
    sender=models.CharField(max_length=100)
    message=models.TextField()

    def __str__(self):
        return self.sender
