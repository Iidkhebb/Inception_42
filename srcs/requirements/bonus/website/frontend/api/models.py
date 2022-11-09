from django.db import models

class Market(models.Model):
	price = models.IntegerField(default=0)
	Market = models.CharField(max_length=50, unique=True)
	pair = models.CharField(max_length=50, unique=True)
	score =  models.FloatField(default=0.0)
	audit = models.BooleanField(null=False, default=False)
