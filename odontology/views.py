# -*- coding: utf-8 -*-

#DJANGO IMPORTS
from django.shortcuts import render, redirect, render_to_response,get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from .models import Dentist, Address, User, Course, ToothStatus, Tooth, ToothDivision, ProcedureStatus
from .forms import DentistForm, AddressForm, CourseForm, ToothStatusForm, ToothForm, ToothDivisionForm, ProcedureStatusForm


# Signup dentist ---------------------------------------------------------------------------------#
def index(request):
	return render(request, 'index.html')

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

# Signup TeethStatus -----------------------------------------------------------------------------#

def tooth_status_index(request):
	tooth_status = ToothStatus.objects.all()
	return render(request, 'odontology/tooth_status/tooth_status_index.html', { 'tooth_status': tooth_status }, context_instance=RequestContext(request))

def tooth_status_register(request, tooth_status_id=None):

	if tooth_status_id: # Edit
		tooth_status = ToothStatus.objects.get(pk=tooth_status_id)
		form_tooth_status = ToothStatusForm(instance=tooth_status)
	else: # New
		form_tooth_status = ToothStatusForm

	# Save
	if request.method == 'POST':
		if tooth_status_id:
			form_tooth_status = ToothStatusForm(request.POST, instance=tooth_status)
			if form_tooth_status.is_valid():
				form_tooth_status.save()
		else:
			form_tooth_status = ToothStatusForm(request.POST)
			if form_tooth_status.is_valid():
				form_tooth_status.save()

		return redirect('tooth_status_index')

	return render(request, 'odontology/tooth_status/tooth_status_register.html', {'form_tooth_status': form_tooth_status}, context_instance=RequestContext(request))

def tooth_status_show(request, tooth_status_id):
	tooth_status = ToothStatus.objects.get(pk=tooth_status_id)
	return render(request, 'odontology/tooth_status/tooth_status_show.html', {'tooth_status': tooth_status}, context_instance=RequestContext(request))

def tooth_status_delete(request, tooth_status_id)	:
	tooth_status = ToothStatus.objects.get(pk=tooth_status_id)
	tooth_status.delete()
	return redirect('tooth_status_index')
	
# End TeethStatus --------------------------------------------------------------------------------#

# Signup Tooth -----------------------------------------------------------------------------------#

def tooth_index(request):
	teeth = Tooth.objects.all()
	return render(request, 'odontology/tooth/tooth_index.html', {'teeth': teeth}, context_instance=RequestContext(request))

def tooth_register(request, tooth_id=None):

	if tooth_id: # Edit
		tooth = Tooth.objects.get(pk=tooth_id)
		form_tooth = ToothForm(instance=tooth)
	else: # New
		form_tooth = ToothForm

	# Save
	if request.method == 'POST':
		if tooth_id: # Edit
			form_tooth = ToothForm(request.POST, instance=tooth)
			if form_tooth.is_valid():
				form_tooth.save()
		else:
			form_tooth = ToothForm(request.POST)
			if form_tooth.is_valid():
				form_tooth.save()

		return redirect('tooth_index')

	return render(request, 'odontology/tooth/tooth_register.html', {'form_tooth': form_tooth}, context_instance=RequestContext(request))

def tooth_show(request, tooth_id):
	tooth = Tooth.objects.get(pk=tooth_id)
	return render(request, 'odontology/tooth/tooth_show.html', {'tooth': tooth}, context_instance=RequestContext(request))

def tooth_delete(request, tooth_id):
	tooth = Tooth.objects.get(pk=tooth_id)
	tooth.delete()
	return redirect('tooth_index')

# End TeethStatus --------------------------------------------------------------------------------#

# Signup ToothDivision----------------------------------------------------------------------------#

def tooth_division_index(request):
	teeth_division = ToothDivision.objects.all()
	return render(request, 'odontology/tooth_division/tooth_division_index.html', {'teeth_division': teeth_division}, context_instance=RequestContext(request))

def tooth_division_register(request, tooth_division_id=None):

	if tooth_division_id: # Edit
		tooth_division = ToothDivision.objects.get(pk=tooth_division_id)
		form_tooth_division = ToothDivisionForm(instance=tooth_division)
	else: # New
		form_tooth_division = ToothDivisionForm

	# Save
	if request.method == 'POST':
		if tooth_division_id: # Edit
			form_tooth_division = ToothDivisionForm(request.POST, instance=tooth_division)
			if form_tooth_division.is_valid():
				form_tooth_division.save()
		else:
			form_tooth_division = ToothDivisionForm(request.POST)
			if form_tooth_division.is_valid():
				form_tooth_division.save()

		return redirect('tooth_division_index')

	return render(request, 'odontology/tooth_division/tooth_division_register.html', {'form_tooth_division': form_tooth_division}, context_instance=RequestContext(request))

def tooth_division_show(request, tooth_division_id):
	tooth_division = ToothDivision.objects.get(pk=tooth_division_id)
	return render(request, 'odontology/tooth_division/tooth_division_show.html', {'tooth_division': tooth_division}, context_instance=RequestContext(request))

def tooth_division_delete(request, tooth_division_id):
	tooth_division = ToothDivision.objects.get(pk=tooth_division_id)
	tooth_division.delete()
	return redirect('tooth_division_index')

# End ToothDivision ------------------------------------------------------------------------------#

# Signup ProcedureStatus--------------------------------------------------------------------------#

def procedure_status_index(request):
	procedures_status = ProcedureStatus.objects.all()
	return render(request, 'odontology/procedure_status/procedure_status_index.html', {'procedures_status': procedures_status}, context_instance=RequestContext(request))

def procedure_status_register(request, procedure_status_id=None):

	if procedure_status_id: # Edit
		procedure_status = ProcedureStatus.objects.get(pk=procedure_status_id)
		form_procedure_status = ProcedureStatusForm(instance=procedure_status)
	else: # New
		form_procedure_status = ProcedureStatusForm

	# Save
	if request.method == 'POST':
		if procedure_status_id: # Edit
			form_procedure_status = ProcedureStatusForm(request.POST, instance=procedure_status)
			if form_procedure_status.is_valid():
				form_procedure_status.save()
		else:
			form_procedure_status = ProcedureStatusForm(request.POST)
			if form_procedure_status.is_valid():
				form_procedure_status.save()

		return redirect('procedure_status_index')

	return render(request, 'odontology/procedure_status/procedure_status_register.html', {'form_procedure_status': form_procedure_status}, context_instance=RequestContext(request))

def procedure_status_show(request, procedure_status_id):
	procedure_status = ProcedureStatus.objects.get(pk=procedure_status_id)
	return render(request, 'odontology/procedure_status/procedure_status_show.html', {'procedure_status': procedure_status}, context_instance=RequestContext(request))

def procedure_status_delete(request, procedure_status_id):
	procedure_status = ProcedureStatus.objects.get(pk=procedure_status_id)
	procedure_status.delete()
	return redirect('procedure_status_index')

# End ProcedureStatus ----------------------------------------------------------------------------#