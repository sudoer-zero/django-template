from rest_framework import mixins, viewsets
from .models import Todo
from .serializers import TodoSerializer


class TodoViewSet(mixins.CreateModelMixin,
                  mixins.ListModelMixin,
                  mixins.RetrieveModelMixin,
                  viewsets.GenericViewSet):
    queryset = Todo.objects.all()
    serializer_class = TodoSerializer
