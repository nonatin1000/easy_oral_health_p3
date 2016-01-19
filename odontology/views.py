# -*- coding: utf-8 -*-

#DJANGO IMPORTS
from django.shortcuts import render, redirect, render_to_response,get_object_or_404
from django.contrib.contenttypes.models import ContentType
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from .models import Dentist, Address, User, Course, ToothStatus, Tooth, ToothDivision, ProcedureStatus, Patient, Odontogram, Procedure
from .forms import DentistForm, AddressForm, CourseForm, ToothStatusForm, ToothForm, ToothDivisionForm, ProcedureStatusForm, PatientForm, OdontogramForm, ProcedureForm


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
			dentist_type = ContentType.objects.get_for_model(Dentist) # Recupero o ContentType do model Dentist
			address = Address.objects.get(object_id=user_id, content_type=dentist_type)
		except Address.DoesNotExist:
			address = Address(object_id=user_id, content_type=dentist_type)
		
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
				form_address = AddressForm(request.POST, instance=Address(content_object=dentist))
			if form_address.is_valid():
				form_address.save()
		return redirect('dentist_index')

	return render(request, 'odontology/dentist/dentist_register.html', {'form_dentist': form_dentist, 'form_address': form_address}, context_instance=RequestContext(request))
	
def dentist_show(request, user_id):
	dentist = Dentist.objects.get(pk=user_id)
	dentist_type = ContentType.objects.get_for_model(Dentist) # Recupero o ContentType do model Dentist
	address = Address.objects.get(object_id=user_id, content_type=dentist_type)
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

# Signup Patient ---------------------------------------------------------------------------------#

def patient_index(request):
	patients = Patient.objects.all()
	return render(request, 'odontology/patient/patient_index.html', {'patients': patients}, context_instance=RequestContext(request))

# New e Edit - Patient
def patient_register(request, patient_id=None):
	
	# Edit Patient
	if patient_id:
		patient = Patient.objects.get(pk=patient_id)
		try:
			patient_type = ContentType.objects.get_for_model(Patient) # Recupero o ContentType do model Patient
			address = Address.objects.get(object_id=patient_id, content_type=patient_type)
		except Address.DoesNotExist:
			address = Address(object_id=patient_id, content_type=patient_type)

		form_patient = PatientForm(instance=patient)
		form_address = AddressForm(instance=address)
	else: # New Patient
		form_patient = PatientForm
		form_address = AddressForm
		
	# Save	
	if request.method == 'POST':

		# New Dependet

		if patient_id: # Edit
			form_patient = PatientForm(request.POST, instance=patient)
			form_address = AddressForm(request.POST,instance=address)
			if form_patient.is_valid():
				form_patient.save()
			if form_address.is_valid():
				form_address.save()
		else: # New
			form_patient = PatientForm(request.POST)
			if form_patient.is_valid():
				patient = form_patient.save()
				form_address = AddressForm(request.POST,instance=Address(content_object=patient))
			if form_address.is_valid():
				form_address.save()
		return redirect('patient_index')

	return render(request, 'odontology/patient/patient_register.html', {'form_patient': form_patient, 'form_address': form_address}, context_instance=RequestContext(request))

def patient_show(request, patient_id):
	patient = Patient.objects.get(pk=patient_id)
	#dependents = patient.dependent.all() # List all Dependents in the Patient
	patient_type = ContentType.objects.get_for_model(Patient) # Recupero o ContentType do model Patient
	address = Address.objects.get(object_id=patient_id, content_type=patient_type)
	return render(request, 'odontology/patient/patient_show.html', {'patient': patient, 'address': address}, context_instance=RequestContext(request))

def patient_delete(request, patient_id):
	patient = Patient.objects.get(pk=patient_id)
	patient.delete()
	return redirect('patient_index')

# End Patient ------------------------------------------------------------------------------------#

# Signup Odontogram-------------------------------------------------------------------------------#

def odontogram_index(request):
	odontogramas = Odontogram.objects.all()
	return render(request, 'odontology/odontogram/odontogram_index.html', {'odontogramas': odontogramas}, context_instance=RequestContext(request))

def odontogram_register(request, odontogram_id=None):

	if odontogram_id: # Edit
		odontogram = Odontogram.objects.get(pk=odontogram_id)
		form_odontogram = OdontogramForm(instance=odontogram)
	else: # New
		form_odontogram = OdontogramForm

	# Save
	if request.method == 'POST':
		if odontogram_id: # Edit
			form_odontogram = OdontogramForm(request.POST, instance=odontogram)
			if form_odontogram.is_valid():
				form_odontogram.save()
		else:
			form_odontogram = OdontogramForm(request.POST)
			if form_odontogram.is_valid():
				form_odontogram.save()

		return redirect('odontogram_index')

	return render(request, 'odontology/odontogram/odontogram_register.html', {'form_odontogram': form_odontogram}, context_instance=RequestContext(request))

def odontogram_show(request, odontogram_id):
	odontogram = Odontogram.objects.get(pk=odontogram_id)
	return render(request, 'odontology/odontogram/odontogram_show.html', {'odontogram': odontogram}, context_instance=RequestContext(request))

def odontogram_delete(request, odontogram_id):
	odontogram = Odontogram.objects.get(pk=odontogram_id)
	odontogram.delete()
	return redirect('odontogram_index')

# End Odontogram ---------------------------------------------------------------------------------#

# Signup Procedure--------------------------------------------------------------------------------#

def procedure_index(request):
	procedures = Procedure.objects.all()
	return render(request, 'odontology/procedure/procedure_index.html', {'procedures': procedures}, context_instance=RequestContext(request))

def procedure_register(request, procedure_id=None):

	if procedure_id: # Edit
		procedure = Procedure.objects.get(pk=procedure_id)
		form_procedure = ProcedureForm(instance=procedure)
	else: # New
		form_procedure = ProcedureForm

	# Save
	if request.method == 'POST':
		if procedure_id: # Edit
			form_procedure = ProcedureForm(request.POST, instance=procedure)
			if form_procedure.is_valid():
				form_procedure.save()
		else:
			form_procedure = ProcedureForm(request.POST)
			if form_procedure.is_valid():
				form_procedure.save()

		return redirect('procedure_index')

	return render(request, 'odontology/procedure/procedure_register.html', {'form_procedure': form_procedure}, context_instance=RequestContext(request))

def procedure_show(request, procedure_id):
	procedure = Procedure.objects.get(pk=procedure_id)
	return render(request, 'odontology/procedure/procedure_show.html', {'procedure': procedure}, context_instance=RequestContext(request))

def procedure_delete(request, procedure_id):
	procedure = Procedure.objects.get(pk=procedure_id)
	procedure.delete()
	return redirect('procedure_index')