# -*- coding: utf-8 -*-

#DJANGO IMPORTS
from django.shortcuts import render, redirect, render_to_response,get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from .models import Dentist, Address, User
from .forms import DentistForm, AddressForm



def dentist_index(request):
	dentists = Dentist.objects.all()
	return render(request, 'odontology/dentist/dentist_index.html', { 'dentists': dentists }, context_instance=RequestContext(request))

def dentist_register(request, user_id=None):
	dentist = Dentist.objects.get(pk=user_id)
	address = None

	try:
		address = Address.objects.get(dentist=dentist)
	except Address.DoesNotExist:
		address = Address(dentist=dentist)

	if user_id:
		dentist = Dentist.objects.get(pk=user_id)

	form_dentist = DentistForm(instance=dentist)
	form_address = AddressForm(instance=address)
	
	if request.method == 'POST':
		form_dentist = DentistForm(request.POST, instance=dentist)
		form_address = AddressForm(request.POST,instance=address)
		if form_dentist.is_valid():
			form_dentist.save()
		if form_address.is_valid():
			form_address.save()
			return redirect('dentist_index')

	return render(request, 'odontology/dentist/dentist_register.html', {'form_dentist': form_dentist, 'form_address': form_address}, context_instance=RequestContext(request))
	
def dentist_show(request, user_id):
	user = User.objects.get(pk=user_id)
	dentist = Dentist.objects.get(pk=user.id)
	address = Address.objects.get(dentist_id=dentist)
	return render(request, 'odontology/dentist/dentist_show.html', {'dentist': dentist, 'address': address})

def dentist_delete(request, user_id):
	dentist = Dentist.objects.get(id=user_id)
	dentist.delete()
	return redirect('dentist_index')
