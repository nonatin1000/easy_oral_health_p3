# -*- coding: utf-8 -*-

#DJANGO IMPORTS
from django.shortcuts import render, redirect, render_to_response,get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from .models import Dentist, Address, User, Course
from .forms import DentistForm, AddressForm, CourseForm


# Signup dentist ---------------------------------------------------------------------------------#
def dentist_index(request):
	dentists = Dentist.objects.all()
	return render(request, 'odontology/dentist/dentist_index.html', { 'dentists': dentists }, context_instance=RequestContext(request))

# New e Edit - Dentist
def dentist_register(request, user_id=None):
	
	# Edit Dentist
	if user_id:
		dentist = Dentist.objects.get(pk=user_id)
		try:
			address = Address.objects.get(dentist=dentist)
		except Address.DoesNotExist:
			address = Address(dentist=dentist)
		
		form_dentist = DentistForm(instance=dentist)
		form_address = AddressForm(instance=address)
	else: # New Dentist
		form_dentist = DentistForm
		form_address = AddressForm
		
	# Save	
	if request.method == 'POST':
		if user_id: # Edit
			form_dentist = DentistForm(request.POST, instance=dentist)
			form_address = AddressForm(request.POST,instance=address)
			if form_dentist.is_valid():
				form_dentist.save()
			if form_address.is_valid():
				form_address.save()
		else: # New
			form_dentist = DentistForm(request.POST)
			if form_dentist.is_valid():
				dentist = form_dentist.save()
				form_address = AddressForm(request.POST,instance=Address(dentist=dentist))
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

# End dentist ------------------------------------------------------------------------------------#

# Signup course ----------------------------------------------------------------------------------#
def course_index(request):
	courses = Course.objects.all()
	return render(request, 'odontology/course/course_index.html', { 'courses': courses }, context_instance=RequestContext(request))


# New e Edit - Course 
def course_register(request, course_id=None):

	if course_id: # Edit
		course = Course.objects.get(pk=course_id)
		form_course = CourseForm(instance=course)
	else: # New
		form_course = CourseForm

	# Save 
	if request.method == 'POST':
		if course_id: # Edit
			form_course = CourseForm(request.POST, instance=course)
			if form_course.is_valid():
				form_course.save()
		else: # New
			form_course = CourseForm(request.POST)
			if form_course.is_valid():
				form_course.save()

		return redirect('course_index')

	return render(request, 'odontology/course/course_register.html', {'form_course': form_course}, context_instance=RequestContext(request))

def course_show(request, course_id):
	course = Course.objects.get(pk=course_id)
	return render(request, 'odontology/course/course_show.html', {'course': course}, context_instance=RequestContext(request))

def course_delete(request, course_id):
	course = Course.objects.get(pk=course_id)
	course.delete()
	return redirect('course_index')

# End course -------------------------------------------------------------------------------------#

# Signup course ----------------------------------------------------------------------------------#

