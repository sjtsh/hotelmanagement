from django.contrib import admin

from hotelmanagementapp.models import *

# Register your models here.
admin.site.register(User)
admin.site.register(Room)
admin.site.register(Food)
admin.site.register(RoomBooking)
admin.site.register(ImageGallery)