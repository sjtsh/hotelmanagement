from datetime import datetime
from operator import truediv
from django.shortcuts import render
from django.http import JsonResponse
from matplotlib.style import available
from rest_framework.decorators import api_view
from rest_framework.response import Response
from hotelmanagementapp.models import *
# Create your views here.


# average rating, img, id, name, amount, in stock
# @api_view(['GET', 'POST', 'DELETE'])
@api_view(['GET'])
def getFoods(request):
    returnableDict = []
    foods = Food.objects.all()
    for i in foods:
        aDict = {}
        aDict["id"] = i.id
        aDict["img"] = i.img
        aDict["name"] = i.name
        aDict["cost"] = i.cost
        aDict["in_stock"] = i.in_stock

        # to calculate average rating of the room
        # if not rated is shown as null
        food_bookings = FoodOrderItem.objects.all().filter(food=i)
        count = 0
        total_ratings = 0
        for i in food_bookings:
            if i.food_order.rating != None:
                count += 1
                total_ratings += i.food_order.rating
        if count > 0:
            aDict["rating"] = int(total_ratings/count)
        returnableDict.append(aDict)
    return Response(returnableDict)


@api_view(['PUT'])
def rateOrder(request):
    try:
        id = int(request.data["id"])
        rating = int(request.data["rating"])
        foodOrder = FoodOrder.objects.get(id=id)
        foodOrder.rating = rating
        foodOrder.save()
        return Response(True)
    except:
        return Response(False)


# input should be in this form {"user_id":"<user_id>", "items" :{"<sku_id>":"<quantity>"}}

@api_view(['POST'])
def createOrder(request):
    try:
        user = User.objects.get(id=int(request.data["user_id"]))  # user_id
        items = request.data["items"]
        food_order = FoodOrder.objects.create(user=user)
        for i in items.keys():
            FoodOrderItem.objects.create(Food.objects.get(
                id=i, qty=items[i], food_order=food_order))
        returnableDict = request.data
        returnableDict["id"] = food_order.id
        returnableDict["created"] = food_order.created
        return Response(returnableDict)
    except:
        return Response(False)


@api_view(['GET'])
def getOrders(request, pk):
    returnableDict = []
    if 1 == 1:
        food_orders = FoodOrder.objects.all().filter(user=User.objects.get(id=pk))
        for i in food_orders:
            aDict = {}
            aDict["id"] = i.id
            if i.rating != None:
                aDict["rating"] = i.rating
            food_order_items = FoodOrderItem.objects.all().filter(food_order=i)
            aDict["items"] = {}
            aDict["created"] = i.created
            for i in food_order_items:
                aDict["items"][i.food.id] = i.qty
    return Response(returnableDict)
