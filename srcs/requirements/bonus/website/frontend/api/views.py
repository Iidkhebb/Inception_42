from django.shortcuts import render
from rest_framework import generics
from .models import Market
from .serializers import RoomSerializer

class MarketShow(generics.CreateAPIView):
	class Meta:
		serializer_class = RoomSerializer
		queryset = Market.objects.all()