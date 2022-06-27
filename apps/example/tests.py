from django.test import TestCase
from .models import Todo


class TodoTestCase(TestCase):
    def setUp(self):
        Todo.objects.create(
            title="To-do example",
            description="This is for testing",
            done=False
        )

    def test_todo_title(self):
        todo = Todo.objects.get(id=1)
        field_label = todo._meta.get_field('title').verbose_name
        self.assertEqual(field_label, 'title')

    def test_todo_description(self):
        todo = Todo.objects.get(id=1)
        field_label = todo._meta.get_field('description').verbose_name
        self.assertEqual(field_label, 'description')

    def test_todo_done(self):
        todo = Todo.objects.get(id=1)
        self.assertEqual(todo.done, False)
