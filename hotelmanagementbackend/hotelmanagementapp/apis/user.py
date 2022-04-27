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
<<<<<<< HEAD
        username = request.data["username"]
        password = request.data["password"]
=======
        username =request.data["username"]
        password =request.data["password"]
>>>>>>> eb86951ac5b7d98a90b7ab01fbd61ba7b4b9760b
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
<<<<<<< HEAD
        user = User.objects.get(id=username, password=password)
        return Response({"username": user.username, "created": user.created})
=======
        user = User.objects.get(username=username, password = password)
        return Response({"username": user.username, "id": user.id ,"created": user.created})
>>>>>>> eb86951ac5b7d98a90b7ab01fbd61ba7b4b9760b
    except:
        return Response(False)
