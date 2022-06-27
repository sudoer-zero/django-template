from rest_framework import routers
from apps.example.views import TodoViewSet

api = routers.DefaultRouter()
api.trailing_slash = '/?'

# Example API
api.register(r'to-dos', TodoViewSet)
