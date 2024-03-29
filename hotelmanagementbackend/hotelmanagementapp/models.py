from tracemalloc import start
from django.db import models

# Create your models here.


class User(models.Model):
    username = models.TextField()
    password = models.TextField()
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.username


class Room(models.Model):
    room_id = models.IntegerField()
    cost = models.IntegerField()
    type = models.TextField()  # deluxe modern
    snippet = models.TextField()  # 2bhk
    description = models.TextField()
    has_tv = models.BooleanField()
    has_scent = models.BooleanField()
    has_vip = models.BooleanField()
    has_view = models.BooleanField()
    has_wifi = models.BooleanField()

    def __str__(self):
        return str(self.id)


class ImageGallery(models.Model):
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    img = models.TextField()


class RoomBooking(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    rating = models.IntegerField(blank=True, null=True)
    start_date = models.DateField()
    end_date = models.DateField()
    paidStatus = models.BooleanField(default=False)

    def __str__(self):
        return self.user.username + " " + str(self.room.room_id)

# /static/room/1.jpg
# http://192.168.1.68:8000/static/room/1.jpg

class Food(models.Model):
    name = models.TextField()
    img = models.TextField()
    cost = models.IntegerField()
    in_stock = models.BooleanField(default=True)

    def __str__(self):
        return self.name


class FoodOrder(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    rating = models.IntegerField(blank=True, null=True)
    paidStatus = models.BooleanField(default=False)

    def __str__(self):
        return str(self.created)


class FoodOrderItem(models.Model):
    food = models.ForeignKey(Food, on_delete=models.CASCADE)
    food_order = models.ForeignKey(FoodOrder, on_delete=models.CASCADE)
    qty = models.IntegerField(blank=True, null=True)

    def __str__(self):
        return self.food_order.created + " " + str(self.qty)
