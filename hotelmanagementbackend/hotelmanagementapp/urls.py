from django.urls import path

from .views import *
from .apis.booking import *
from .apis.food import *
from .apis.user import *

urlpatterns = [
    path('', getRoutes),

    path('signin/', signIn),
    path('signup/', signUp),

    path('foods/', getFoods),
    path('orders/<int:pk>/', getOrders),
    path('order/rate/', rateOrder),
    path('order/create/', createOrder),

    path('rooms/', getRooms),
    path('bookings/<int:pk>/', getBookings),
    path('booking/rate/', rateBooking),
    path('booking/create/', createBooking),
]
