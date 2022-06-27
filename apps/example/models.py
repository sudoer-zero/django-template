from django.db import models


class Todo(models.Model):
    title = models.TextField(max_length=100)
    description = models.TextField(max_length=200)
    done = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'To-do'
        verbose_name_plural = 'To-dos'

    def __str__(self):
        return self.title
