from datetime import datetime
from operator import truediv
from django.shortcuts import render
from django.http import JsonResponse
from matplotlib.style import available
from rest_framework.decorators import api_view
from rest_framework.response import Response
from models import *
# Create your views here.
#login and signup
# booking a room and ordering food


@api_view(['POST'])
def signUp(request):
    if 1 == 1:
        username = int(request.data["username"])
        password = int(request.data["password"])
        try:
            user = User.objects.get(id=username)
            return Response(False)
        except:
            user = User.objects.create(username=username, password=password)
            return Response({"username": user.username, "created": user.created})

@api_view(['POST'])
def signIn(request):
    username = int(request.data["username"])
    password = int(request.data["password"])
    try:
        user = User.objects.get(id=username, password = password)
        return Response({"username": user.username, "created": user.created})
    except:
        return Response(False)
    