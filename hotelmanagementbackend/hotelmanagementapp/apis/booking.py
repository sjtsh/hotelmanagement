from datetime import datetime
from operator import truediv
from django.shortcuts import render
from django.http import JsonResponse
from matplotlib.style import available
from rest_framework.decorators import api_view
from rest_framework.response import Response
from hotelmanagementapp.models import *
# Create your views here.

# @api_view(['GET', 'POST', 'DELETE'])
@api_view(['GET'])
def getRooms(request):
    returnableDict = []
    rooms = Room.objects.all()
    for i in rooms:
        aDict = {}
        aDict["id"] = i.room_id
        aDict["cost"] = i.cost
        aDict["type"] = i.type
        aDict["snippet"]= i.snippet  #2bhk
        aDict["description"]= i.description 
        aDict["has_tv"]= i.has_tv 
        aDict["has_scent"]= i.has_scent 
        aDict["has_vip"]= i.has_vip 
        aDict["has_view"]= i.has_view 
        aDict["has_wifi"]= i.has_wifi 

        #all the images in a list
        imagesSQL = ImageGallery.objects.all().filter(room = i)
        aDict["image"] = []
        for i in imagesSQL:
            aDict["image"].append(i.img)

        #to check whether the room is availalble for now
        room_bookings = RoomBooking.objects.all().filter(room = i)
        now = datetime.now()
        available = True
        for i in room_bookings:
            if(i.start_date >= now and i.end_date >= now.date):
                available = False
        aDict["available"] = available

        #to calculate average rating of the room
        #if not rated is shown as null
        count = 0
        total_ratings = 0
        for i in room_bookings:
            if i.rating != None:
                count += 1
                total_ratings += i.rating
        if count > 0:
            aDict["rating"] = int(total_ratings/count)
        returnableDict.append(aDict)


    return Response(returnableDict)


@api_view(['PUT'])
def rateBooking(request):
    try:
        id = int(request.data["id"])
        rating = int(request.data["rating"])
        room_booking = RoomBooking.objects.get(id = id)
        room_booking.rating = rating
        room_booking.save()
        return Response(True)
    except:
        return Response(False)

        
@api_view(['POST'])
def createBooking(request):
    try:
        user = User.objects.get(id = int(request.data["user_id"]))
        room = Room.objects.get(id = int(request.data["room_id"]))
        start_date = request.data["start_date"]
        end_date = request.data["end_date"]
        room_booking = RoomBooking.objects.create(user = user, room = room, start_date = start_date, end_date = end_date)
        returnableDict = request.data
        returnableDict["id"] = room_booking.id
        return Response(returnableDict)
    except:
        return Response(False)


@api_view(['GET'])
def getBookings(request, pk):
    returnableDict = []
    if 1==1:
        room_bookings = RoomBooking.objects.all().filter(user = User.objects.get(id = pk))
        for i in room_bookings:
            aDict = {}
            aDict["id"] = i.id
            aDict["room_id"] = i.room.id
            if i.rating != None:
                aDict["rating"] = i.rating
            aDict["start_date"] = i.start_date
            aDict["end_date"] = i.end_date
        return Response(returnableDict)
