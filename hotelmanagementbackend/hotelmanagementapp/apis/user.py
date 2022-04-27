from datetime import datetime
from operator import truediv
from django.shortcuts import render
from django.http import JsonResponse
from matplotlib.style import available
from rest_framework.decorators import api_view
from rest_framework.response import Response
from hotelmanagementapp.models import *
# Create your views here.
#login and signup
# booking a room and ordering food


@api_view(['POST'])
def signUp(request):
    if 1 == 1:
        username = request.data["username"]
        password = request.data["password"]
        try:
            user = User.objects.get(username=username)
            return Response(False)
        except:
            user = User.objects.create(username=username, password=password)
            return Response({"username": user.username, "created": user.created})


@api_view(['POST'])
def signIn(request):
    username = request.data["username"]
    password = request.data["password"]
    try:
        user = User.objects.get(username=username, password = password)
        return Response({"username": user.username, "id": user.id ,"created": user.created})
    except:
        return Response(False)
