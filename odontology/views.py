# -*- coding: utf-8 -*-

#DJANGO IMPORTS
from django.shortcuts import render, redirect, render_to_response, get_object_or_404
from django.contrib.contenttypes.models import ContentType
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.forms import formset_factory
from .models import Dentist, Address, User, Course, ToothStatus, Tooth, ToothDivision, ProcedureStatus, Patient, PatientTooth, PatientDentalProcedure, ProcedureDental, OralProcedure, OralPatientProcedure
from .forms import DentistForm, AddressForm, CourseForm, ToothStatusForm, ToothForm, ToothDivisionForm, ProcedureStatusForm, PatientForm, PatientToothForm, PatientDentalProcedureForm, ProcedureDentalForm, OralProcedureForm, OralPatientProcedureForm


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
				return redirect('dentist_index')
		else: # New
			form_dentist = DentistForm(request.POST)
			form_address = AddressForm(request.POST)
			if form_dentist.is_valid() and form_address.is_valid():
				dentist = form_dentist.save()
				form_address = AddressForm(request.POST, instance=Address(content_object=dentist))
				form_address.save()
				return redirect('dentist_index')

	return render(request, 'odontology/dentist/dentist_register.html', {'form_dentist': form_dentist, 'form_address': form_address,}, context_instance=RequestContext(request))
	
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
		course = None

	# Save 
	if request.method == 'POST':
		if course_id: # Edit
			form_course = CourseForm(request.POST, instance=course)
			if form_course.is_valid():
				form_course.save()
				return redirect('course_index')
		else: # New
			form_course = CourseForm(request.POST)
			if form_course.is_valid():
				form_course.save()
				return redirect('course_index')

	return render(request, 'odontology/course/course_register.html', {'form_course': form_course, 'course': course}, context_instance=RequestContext(request))

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
		tooth_status = None

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

	return render(request, 'odontology/tooth_status/tooth_status_register.html', {'form_tooth_status': form_tooth_status, 'tooth_status': tooth_status}, context_instance=RequestContext(request))

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
		tooth = None

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

	return render(request, 'odontology/tooth/tooth_register.html', {'form_tooth': form_tooth, 'tooth': tooth}, context_instance=RequestContext(request))

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
		tooth_division = None

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

	return render(request, 'odontology/tooth_division/tooth_division_register.html', {'form_tooth_division': form_tooth_division, 'tooth_division': tooth_division}, context_instance=RequestContext(request))

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
		procedure_status = None

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

	return render(request, 'odontology/procedure_status/procedure_status_register.html', {'form_procedure_status': form_procedure_status, 'procedure_status': procedure_status}, context_instance=RequestContext(request))

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

		if patient_id: # Edit
			form_patient = PatientForm(request.POST, instance=patient)
			form_address = AddressForm(request.POST,instance=address)
			if form_patient.is_valid():
				form_patient.save()
			if form_address.is_valid():
				form_address.save()
				return redirect('patient_index')
		else: # New
			form_patient = PatientForm(request.POST)
			form_address = AddressForm(request.POST)
			if form_patient.is_valid() and form_address.is_valid():
				patient = form_patient.save()
				form_address = AddressForm(request.POST,instance=Address(content_object=patient))
				form_address.save()
				return redirect('patient_index')

	return render(request, 'odontology/patient/patient_register.html', {'form_patient': form_patient, 'form_address': form_address}, context_instance=RequestContext(request))

def patient_show(request, patient_id):
	patient = Patient.objects.get(pk=patient_id)
	patient_type = ContentType.objects.get_for_model(Patient) # Recupero o ContentType do model Patient
	address = Address.objects.get(object_id=patient_id, content_type=patient_type)
	return render(request, 'odontology/patient/patient_show.html', {'patient': patient, 'address': address}, context_instance=RequestContext(request))

def patient_delete(request, patient_id):
	patient = Patient.objects.get(pk=patient_id)
	patient.delete()
	return redirect('patient_index')

def dependent_register(request, patient_id):
	DependetFormSet = formset_factory(PatientForm)
	patient = Patient.objects.get(pk=patient_id)
	# Save	
	if request.method == 'POST':
	    # New Dependet
		formset = DependetFormSet(request.POST)
		if formset.is_valid():
			for form in formset:
				dependent = patient.dependents.create(
        			name = form.cleaned_data.get('name'),
					email = form.cleaned_data.get('email'),
					phone = form.cleaned_data.get('phone'),
					marital_status = form.cleaned_data.get('marital_status'),
					types = form.cleaned_data.get('types'),
					sex = form.cleaned_data.get('sex')
                )
				dependent.save()
		return redirect('patient_index')	
	return render(request, 'odontology/patient/dependent_register.html', {'patient': patient, 'formset': DependetFormSet() }, context_instance=RequestContext(request))

# End Patient ------------------------------------------------------------------------------------#

# Signup PatientTooth-------------------------------------------------------------------------------#

def patient_tooth_index(request):
	patient_teeth = PatientTooth.objects.all()
	return render(request, 'odontology/patient_tooth/patient_tooth_index.html', {'patient_teeth': patient_teeth}, context_instance=RequestContext(request))

def patient_tooth_register(request, patient_tooth_id=None):

	if patient_tooth_id: # Edit
		patient_tooth = PatientTooth.objects.get(pk=patient_tooth_id)
		form_patient_tooth = PatientToothForm(instance=patient_tooth)
	else: # New
		form_patient_tooth = PatientToothForm

	# Save
	if request.method == 'POST':
		if patient_tooth_id: # Edit
			form_patient_tooth = PatientToothForm(request.POST, instance=patient_tooth)
			if form_patient_tooth.is_valid():
				form_patient_tooth.save()
				return redirect('patient_tooth_index')
		else: # New
			form_patient_tooth = PatientToothForm(request.POST)
			if form_patient_tooth.is_valid():
				form_patient_tooth.save()
				return redirect('patient_tooth_index')

	return render(request, 'odontology/patient_tooth/patient_tooth_register.html', {'form_patient_tooth': form_patient_tooth}, context_instance=RequestContext(request))

def patient_tooth_show(request, patient_tooth_id):
	patient_tooth = PatientTooth.objects.get(pk=patient_tooth_id)
	return render(request, 'odontology/patient_tooth/patient_tooth_show.html', {'patient_tooth': patient_tooth}, context_instance=RequestContext(request))

def patient_tooth_delete(request, patient_tooth_id):
	patient_tooth = PatientTooth.objects.get(pk=patient_tooth_id)
	patient_tooth.delete()
	return redirect('patient_tooth_index')

# End PatientTooth ---------------------------------------------------------------------------------#

# Signup PatientDentalProcedure-------------------------------------------------------------------#

def patient_dental_procedure_index(request):
	patient_dental_procedures = PatientDentalProcedure.objects.all()
	return render(request, 'odontology/patient_dental_procedure/patient_dental_procedure_index.html', {'patient_dental_procedures': patient_dental_procedures}, context_instance=RequestContext(request))

def patient_dental_procedure_register(request, patient_dental_procedure_id=None):

	if patient_dental_procedure_id: # Edit
		patient_dental_procedure = PatientDentalProcedure.objects.get(pk=patient_dental_procedure_id)
		form_patient_dental_procedure = PatientDentalProcedureForm(instance=patient_dental_procedure)
	else: # New
		form_patient_dental_procedure = PatientDentalProcedureForm

	# Save
	if request.method == 'POST':
		if patient_dental_procedure_id: # Edit
			form_patient_dental_procedure = PatientDentalProcedureForm(request.POST, instance=patient_dental_procedure)
			if form_patient_dental_procedure.is_valid():
				form_patient_dental_procedure.save()
				return redirect('patient_dental_procedure_index')
		else:
			form_patient_dental_procedure = PatientDentalProcedureForm(request.POST)
			if form_patient_dental_procedure.is_valid():
				form_patient_dental_procedure.save()
				return redirect('patient_dental_procedure_index')

	return render(request, 'odontology/patient_dental_procedure/patient_dental_procedure_register.html', {'form_patient_dental_procedure': form_patient_dental_procedure}, context_instance=RequestContext(request))

def patient_dental_procedure_show(request, patient_dental_procedure_id):
	patient_dental_procedure = PatientDentalProcedure.objects.get(pk=patient_dental_procedure_id)
	return render(request, 'odontology/patient_dental_procedure/patient_dental_procedure_show.html', {'patient_dental_procedure': patient_dental_procedure}, context_instance=RequestContext(request))

def patient_dental_procedure_delete(request, patient_dental_procedure_id):
	patient_dental_procedure = PatientDentalProcedure.objects.get(pk=patient_dental_procedure_id)
	patient_dental_procedure.delete()
	return redirect('patient_dental_procedure_index')

# End PatientDentalProcedure --------------------------------------------------------------------#

# Signup ProcedureDental-------------------------------------------------------------------------#

def procedure_dental_index(request):
	procedures_dental = ProcedureDental.objects.all()
	return render(request, 'odontology/procedure_dental/procedure_dental_index.html', {'procedures_dental': procedures_dental}, context_instance=RequestContext(request))

def procedure_dental_register(request, procedure_dental_id=None):

	if procedure_dental_id: # Edit
		procedure_dental = ProcedureDental.objects.get(pk=procedure_dental_id)
		form_procedure_dental = ProcedureDentalForm(instance=procedure_dental)
	else: # New
		procedure_dental = None
		form_procedure_dental = ProcedureDentalForm

	# Save
	if request.method == 'POST':
		if procedure_dental_id: # Edit
			form_procedure_dental = ProcedureDentalForm(request.POST, instance=procedure_dental)
			if form_procedure_dental.is_valid():
				form_procedure_dental.save()
				return redirect('procedure_dental_index')
		else:
			form_procedure_dental = ProcedureDentalForm(request.POST)
			if form_procedure_dental.is_valid():
				form_procedure_dental.save()
				return redirect('procedure_dental_index')

	return render(request, 'odontology/procedure_dental/procedure_dental_register.html', {'form_procedure_dental': form_procedure_dental, 'procedure_dental': procedure_dental}, context_instance=RequestContext(request))

def procedure_dental_show(request, procedure_dental_id):
	procedure_dental = ProcedureDental.objects.get(pk=procedure_dental_id)
	return render(request, 'odontology/procedure_dental/procedure_dental_show.html', {'procedure_dental': procedure_dental}, context_instance=RequestContext(request))

def procedure_dental_delete(request, procedure_dental_id):
	procedure_dental = ProcedureDental.objects.get(pk=procedure_dental_id)
	procedure_dental.delete()
	return redirect('procedure_dental_index')

# End ProcedureDental-----------------------------------------------------------------------------#

# Signup OralProcedure----------------------------------------------------------------------------#

def oral_procedure_index(request):
	oral_procedures = OralProcedure.objects.all()
	return render(request, 'odontology/oral_procedure/oral_procedure_index.html', {'oral_procedures': oral_procedures}, context_instance=RequestContext(request))

def oral_procedure_register(request, oral_procedure_id=None):

	if oral_procedure_id: # Edit
		oral_procedure = OralProcedure.objects.get(pk=oral_procedure_id)
		form_oral_procedure = OralProcedureForm(instance=oral_procedure)
	else: # New
		oral_procedure = None
		form_oral_procedure = OralProcedureForm

	# Save
	if request.method == 'POST':
		if oral_procedure_id: # Edit
			form_oral_procedure = OralProcedureForm(request.POST, instance=oral_procedure)
			if form_oral_procedure.is_valid():
				form_oral_procedure.save()
				return redirect('oral_procedure_index')
		else:
			form_oral_procedure = OralProcedureForm(request.POST)
			if form_oral_procedure.is_valid():
				form_oral_procedure.save()
				return redirect('oral_procedure_index')

	return render(request, 'odontology/oral_procedure/oral_procedure_register.html', {'form_oral_procedure': form_oral_procedure, 'oral_procedure': oral_procedure}, context_instance=RequestContext(request))

def oral_procedure_show(request, oral_procedure_id):
	oral_procedure = OralProcedure.objects.get(pk=oral_procedure_id)
	return render(request, 'odontology/oral_procedure/oral_procedure_show.html', {'oral_procedure': oral_procedure}, context_instance=RequestContext(request))

def oral_procedure_delete(request, oral_procedure_id):
	oral_procedure = OralProcedure.objects.get(pk=oral_procedure_id)
	oral_procedure.delete()
	return redirect('oral_procedure_index')

# End OralProcedure ------------------------------------------------------------------------------#

# Signup OralPatientProcedure---------------------------------------------------------------------#

def oral_patient_procedure_index(request):
	oral_patient_procedures = OralPatientProcedure.objects.all()
	return render(request, 'odontology/oral_patient_procedure/oral_patient_procedure_index.html', {'oral_patient_procedures': oral_patient_procedures}, context_instance=RequestContext(request))

def oral_patient_procedure_register(request, oral_patient_procedure_id=None):

	if oral_patient_procedure_id: # Edit
		oral_patient_procedure = OralPatientProcedure.objects.get(pk=oral_patient_procedure_id)
		form_oral_patient_procedure = OralPatientProcedureForm(instance=oral_patient_procedure)
	else: # New
		form_oral_patient_procedure = OralPatientProcedureForm

	# Save
	if request.method == 'POST':
		if oral_patient_procedure_id: # Edit
			form_oral_patient_procedure = OralPatientProcedureForm(request.POST, instance=oral_patient_procedure)
			if form_oral_patient_procedure.is_valid():
				form_oral_patient_procedure.save()
				return redirect('oral_patient_procedure_index')
		else:
			form_oral_patient_procedure = OralPatientProcedureForm(request.POST)
			if form_oral_patient_procedure.is_valid():
				form_oral_patient_procedure.save()
				return redirect('oral_patient_procedure_index')

	return render(request, 'odontology/oral_patient_procedure/oral_patient_procedure_register.html', {'form_oral_patient_procedure': form_oral_patient_procedure}, context_instance=RequestContext(request))

def oral_patient_procedure_show(request, oral_patient_procedure_id):
	oral_patient_procedure = OralPatientProcedure.objects.get(pk=oral_patient_procedure_id)
	return render(request, 'odontology/oral_patient_procedure/oral_patient_procedure_show.html', {'oral_patient_procedure': oral_patient_procedure}, context_instance=RequestContext(request))

def oral_patient_procedure_delete(request, oral_patient_procedure_id):
	oral_patient_procedure = OralPatientProcedure.objects.get(pk=oral_patient_procedure_id)
	oral_patient_procedure.delete()
	return redirect('oral_patient_procedure_index')

# End OralPatientProcedure ----------------------------------------------------------------------#