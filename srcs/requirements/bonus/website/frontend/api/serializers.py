from rest_framework import serializers
from .models import Market

class RoomSerializer(serializers.ModelSerializer):
	class Meta:
		model = Market
		fields = ('id', 'price','Market', 'pair', 'score', 
					'audit')
		