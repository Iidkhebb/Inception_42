from django.urls import path
from .views import MarketShow

urlpatterns = [
	path('api', MarketShow.as_view()),
]
