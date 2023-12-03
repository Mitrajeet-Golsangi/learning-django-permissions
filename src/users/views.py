from django.shortcuts import render
from django.views import View

from django.http import HttpResponse

# Create your views here.

class HomeView(View):
    def get(self, request, *args, **kwargs):
        return HttpResponse('Hello, This is my Home Page !')

    def post(self, request, *args, **kwargs):
        return HttpResponse('POST request!')