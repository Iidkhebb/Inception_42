from django.http import HttpResponse
from django.shortcuts import render

def index(request):
	return render(request, 'home.html')
def about(request):
	return render(request, 'about.html')
def login(request):
	return render(request, 'login.html')
def notfound(request):
	return render(request, '404.html')