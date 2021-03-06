# -*- coding: utf-8 -*-

#DJANGO IMPORTS
from django.shortcuts import render, redirect, render_to_response, get_object_or_404
from django.core.paginator import Paginator, InvalidPage, EmptyPage
from django.contrib.contenttypes.models import ContentType
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext
from django.contrib import messages
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth import logout
from django.contrib.auth.forms import PasswordChangeForm, UserCreationForm
from django.forms import formset_factory
from datetime import date, datetime
from .models import Dentist, Address, User, Course, Exams, Tooth, ToothDivision, Patient, PatientTooth, PatientDentalProcedure, ProcedureDental, OralProcedure, OralPatientProcedure, Consultation, ExaminationSolicitation
from .forms import DentistForm, AddressForm, CourseForm, ExamsForm, ToothForm, ToothDivisionForm, PatientForm, PatientToothForm, PatientDentalProcedureForm, ProcedureDentalForm, OralProcedureForm, OralPatientProcedureForm, ConsultationForm, ConsultationEditForm, ExaminationSolicitationForm, ExaminationSolicitationEditForm, DependentForm
from dal import autocomplete
from .decorators import odontology_required, patient_show_required
from django.template.response import TemplateResponse  

# Alterar senha do user (Dentista)
@login_required
def dentist_edit_password(request):
	template_name = 'odontology/dentist/dentist_edit_password.html'
	context = {}
	if request.method == 'POST':
		form = PasswordChangeForm(data=request.POST, user=request.user)
		if form.is_valid():
			form.save()
			messages.success(request, 'A sua senha foi alterada com sucesso')
			redirect('login')
	else:
		form = PasswordChangeForm(user=request.user)

	context['form'] = form
	return render(request, template_name, context)

# Autocomplete patiente na consulta
class PatientAutocomplete(autocomplete.Select2QuerySetView):
	def get_queryset(self):
		# Don't forget to filter out results depending on the visitor !
		
		qs = Patient.objects.all()

		if self.q:
			qs = qs.filter(name__istartswith=self.q)

		return qs

# Signup dentist ---------------------------------------------------------------------------------#

def index(request):
	return render(request, 'index.html')

@permission_required('odontology.dentist_index',raise_exception=True)
@login_required
def dentist_index(request):
	template_name = 'odontology/dentist/dentist_index.html'
	dentists = Dentist.objects.all()
	context = {'dentists': dentists}
	return render(request, template_name , context)

# New e Edit - Dentist
@permission_required('odontology.dentist_register',raise_exception=True)
@login_required
def dentist_register(request, user_id=None):
	template_name = 'odontology/dentist/dentist_register.html'
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
	context = {'form_dentist': form_dentist, 'form_address': form_address,}
	return render(request, template_name, context)

@permission_required('odontology.dentist_show',raise_exception=True)
@login_required
def dentist_show(request, user_id):
	template_name = 'odontology/dentist/dentist_show.html'
	dentist = Dentist.objects.get(pk=user_id)
	dentist_type = ContentType.objects.get_for_model(Dentist) # Recupero o ContentType do model Dentist
	address = Address.objects.get(object_id=user_id, content_type=dentist_type)
	context = {'dentist': dentist, 'address': address}
	return render(request, template_name, context)

@permission_required('odontology.dentist_delete',raise_exception=True)
@login_required
def dentist_delete(request, user_id):
	dentist = Dentist.objects.get(id=user_id)
	dentist.delete()
	return redirect('dentist_index')

# End dentist ------------------------------------------------------------------------------------#

# Signup course ----------------------------------------------------------------------------------#
@permission_required('odontology.course_index',raise_exception=True)
@login_required
def course_index(request):
	template_name = 'odontology/course/course_index.html'
	courses = Course.objects.all()
	context = { 'courses': courses }
	return render(request, template_name, context)

# New e Edit - Course 
@permission_required('odontology.course_register',raise_exception=True)
@login_required
def course_register(request, course_id=None):
	template_name = 'odontology/course/course_register.html'
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

	context = {'form_course': form_course, 'course': course}
	return render(request, template_name, context)

@permission_required('odontology.course_show',raise_exception=True)
@login_required
def course_show(request, course_id):
	template_name = 'odontology/course/course_show.html'
	course = Course.objects.get(pk=course_id)
	context = {'course': course}
	return render(request, template_name, context)

@permission_required('odontology.course_delete',raise_exception=True)
@login_required
def course_delete(request, course_id):
	course = Course.objects.get(pk=course_id)
	course.delete()
	return redirect('course_index')

# End course -------------------------------------------------------------------------------------#

# Signup Tooth -----------------------------------------------------------------------------------#
@permission_required('odontology.tooth_index',raise_exception=True)
@login_required
def tooth_index(request):
	template_name = 'odontology/tooth/tooth_index.html'
	teeth = Tooth.objects.all()
	context = {'teeth': teeth}
	return render(request, template_name, context)

@permission_required('odontology.tooth_register',raise_exception=True)
@login_required
def tooth_register(request, tooth_id=None):
	template_name = 'odontology/tooth/tooth_register.html'
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

	context = {'form_tooth': form_tooth, 'tooth': tooth}
	return render(request, template_name, context)

@permission_required('odontology.tooth_show',raise_exception=True)
@login_required
def tooth_show(request, tooth_id):
	template_name = 'odontology/tooth/tooth_show.html'
	tooth = Tooth.objects.get(pk=tooth_id)
	context = {'tooth': tooth}
	return render(request, template_name, context)

@permission_required('odontology.tooth_delete',raise_exception=True)
@login_required
def tooth_delete(request, tooth_id):
	tooth = Tooth.objects.get(pk=tooth_id)
	tooth.delete()
	return redirect('tooth_index')

# End TeethStatus --------------------------------------------------------------------------------#

# Signup ToothDivision----------------------------------------------------------------------------#

@permission_required('odontology.tooth_division_index',raise_exception=True)
@login_required
def tooth_division_index(request):
	template_name = 'odontology/tooth_division/tooth_division_index.html'
	teeth_division = ToothDivision.objects.all()
	context = {'teeth_division': teeth_division}
	return render(request, template_name, context)

@permission_required('odontology.tooth_division_register',raise_exception=True)
@login_required
def tooth_division_register(request, tooth_division_id=None):
	template_name = 'odontology/tooth_division/tooth_division_register.html'
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

	context = {'form_tooth_division': form_tooth_division, 'tooth_division': tooth_division}
	return render(request, template_name, context)

@permission_required('odontology.tooth_division_delete',raise_exception=True)
@login_required
def tooth_division_show(request, tooth_division_id):
	template_name = 'odontology/tooth_division/tooth_division_show.html'
	tooth_division = ToothDivision.objects.get(pk=tooth_division_id)
	context = {'tooth_division': tooth_division}
	return render(request, template_name, context)

@permission_required('odontology.course_index',raise_exception=True)
@login_required
def tooth_division_delete(request, tooth_division_id):
	tooth_division = ToothDivision.objects.get(pk=tooth_division_id)
	tooth_division.delete()
	return redirect('tooth_division_index')

# End ToothDivision ------------------------------------------------------------------------------#

# Signup Patient ---------------------------------------------------------------------------------#
@login_required
def patient_index(request):
	template_name = 'odontology/patient/patient_index.html'
	""" A View of all Patient """
	patients_list = Patient.objects.all()

	""" takes the pacient name through and get stored in the variable var_get_search""" 
	var_get_search = request.GET.get('search_box')
	if var_get_search is not None:
		patients_list = patients_list.filter(name__icontains=var_get_search)
	
	paginator = Paginator(patients_list, 50) # Mostra 50 pacientes por página

	# Make sure page request is an int. If not, deliver first page.
	# Esteja certo de que o `page request` é um inteiro. Se não, mostre a primeira página.
	try:
		page = int(request.GET.get('page', '1'))
	except ValueError:
		page = 1

	# Se o page request (9999) está fora da lista, mostre a última página.
	try:
		patients = paginator.page(page)
	except (EmptyPage, InvalidPage):
		patients = paginator.page(paginator.num_pages)

	context = {'patients': patients}
	return render(request, template_name, context)

# New e Edit - Patient
@login_required
def patient_register(request, patient_id=None):
	template_name = 'odontology/patient/patient_register.html'
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

	context = {'form_patient': form_patient, 'form_address': form_address}
	return render(request, template_name, context)

@login_required
@patient_show_required
def patient_show(request, patient_id):
	template_name = 'odontology/patient/patient_show.html'
	return TemplateResponse(request, template_name, {})

@login_required
def patient_delete(request, patient_id):
	patient = Patient.objects.get(pk=patient_id)
	patient.delete()
	return redirect('patient_index')

@login_required
def dependent_register(request, patient_id):
	template_name = 'odontology/patient/dependent_register.html'
	form_dependent = DependentForm
	form_address = AddressForm
	patient = Patient.objects.get(pk=patient_id)

	# Save	
	if request.method == 'POST':
		# New Dependet
		form_dependent = DependentForm(request.POST)
		form_address   = AddressForm(request.POST)
		if form_dependent.is_valid() and form_address.is_valid():
			dependent = form_dependent.save(commit=False)
			dependent.types = 'Dependente'
			dependent.save()
			# Add o Dependente ao Patient
			patient.dependents.add(dependent)
			# Address Dependent	
			form_address = AddressForm(request.POST,instance=Address(content_object=dependent))
			form_address.save()
			return redirect('patient_index')

	context = {'patient': patient, 'form_dependent': form_dependent, 'form_address': form_address }	
	return render(request, template_name, context)

@login_required
def oral_patient_procedure(request, patient_id):
	template_name = 'odontology/patient/oral_patient_procedure.html'
	dentist = Dentist.objects.get(pk=request.user.id)
	patient = Patient.objects.get(pk=patient_id)
	oral_patient_procedure = OralPatientProcedure.objects.filter(consultation__patient=patient)
	form_oral_patient_procedure = OralPatientProcedureForm # empty form
	context = {
				'oral_patient_procedure': oral_patient_procedure, 
				'patient': patient, 
				'form_oral_patient_procedure': form_oral_patient_procedure
	}
	return render(request, template_name, context)

@login_required
@odontology_required
def consult_patient(request, consultation_id):
	template_name = 'odontology/patient/consult_patient.html'
	consultation = Consultation.objects.get(pk=consultation_id)

	tab_consult = False
	# Save 
	if request.method == 'POST':
		consultation_form = ConsultationEditForm(request.POST, instance=consultation)
		if(consultation_form.is_valid()):
			consultation_form.save()
			tab_consult = True
	
	context = {'tab_consult': tab_consult, 'consultation': consultation}
	return TemplateResponse(request, template_name, context)

# End Patient ------------------------------------------------------------------------------------#

# Signup ProcedureDental-------------------------------------------------------------------------#
@login_required
def procedure_dental_index(request):
	template_name = 'odontology/procedure_dental/procedure_dental_index.html'
	procedures_dental = ProcedureDental.objects.all()
	context = {'procedures_dental': procedures_dental}
	return render(request, template_name, context)

@login_required
def procedure_dental_register(request, procedure_dental_id=None):
	template_name = 'odontology/procedure_dental/procedure_dental_register.html'
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

	context = {
				'form_procedure_dental': form_procedure_dental, 
				'procedure_dental': procedure_dental
	}
	return render(request, template_name, )

@login_required
def procedure_dental_show(request, procedure_dental_id):
	template_name = 'odontology/procedure_dental/procedure_dental_show.html'
	procedure_dental = ProcedureDental.objects.get(pk=procedure_dental_id)
	context = {'procedure_dental': procedure_dental}
	return render(request, template_name, context)

@login_required
def procedure_dental_delete(request, procedure_dental_id):
	procedure_dental = ProcedureDental.objects.get(pk=procedure_dental_id)
	procedure_dental.delete()
	return redirect('procedure_dental_index')

# End ProcedureDental-----------------------------------------------------------------------------#

# Signup OralProcedure----------------------------------------------------------------------------#
@login_required
def oral_procedure_index(request):
	template_name = 'odontology/oral_procedure/oral_procedure_index.html'
	oral_procedures = OralProcedure.objects.all()
	context = {'oral_procedures': oral_procedures}
	return render(request, template_name, context)

@login_required
def oral_procedure_register(request, oral_procedure_id=None):
	template_name = 'odontology/oral_procedure/oral_procedure_register.html'
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

	context = {'form_oral_procedure': form_oral_procedure, 'oral_procedure': oral_procedure}
	return render(request, template_name, context)

@login_required
def oral_procedure_show(request, oral_procedure_id):
	template_name = 'odontology/oral_procedure/oral_procedure_show.html'
	oral_procedure = OralProcedure.objects.get(pk=oral_procedure_id)
	context = {'oral_procedure': oral_procedure}
	return render(request, template_name, context)

@login_required
def oral_procedure_delete(request, oral_procedure_id):
	oral_procedure = OralProcedure.objects.get(pk=oral_procedure_id)
	oral_procedure.delete()
	return redirect('oral_procedure_index')

# End OralProcedure ------------------------------------------------------------------------------#

# Signup PatientDentalProcedure-------------------------------------------------------------------#
@login_required
@odontology_required
def patient_dental_procedure_register(request, consultation_id, valuation=None):
	template_name = 'odontology/patient/consult_patient.html'
	consultation = Consultation.objects.get(pk=consultation_id)
	dentist = Dentist.objects.get(pk=request.user.id)
	# Save 
	if request.method == 'POST':
		# Patient Dental Procedure
		form_patient_dental_procedure = PatientDentalProcedureForm(request.POST, patient=consultation.patient)
		if form_patient_dental_procedure.is_valid():
			patient_dental_procedure = form_patient_dental_procedure.save(commit=False)
			patient_dental_procedure.dentist = dentist # Adiciono o denstista ao form
			patient_dental_procedure.consultation = consultation # Adiciono o consultation ao form
			
			# Quando for uma avaliação
			if valuation is not None:
				patient_dental_procedure.evaluation = True # Adiciono o evaluation ao form
				patient_dental_procedure.save()
				return TemplateResponse(request, template_name, {'evaluation': True})
				
			patient_dental_procedure.save()

	return TemplateResponse(request, template_name, {'tab_odonto': True})

@login_required
def patient_dental_procedure_delete(request, patient_dental_procedure_id):
	patient_dental_procedure = PatientDentalProcedure.objects.get(pk=patient_dental_procedure_id)
	patient = patient_dental_procedure.patient_tooth.patient
	consultation=patient_dental_procedure.consultation
	patient_dental_procedure.delete()
	return redirect('consultation_edit', consultation_id=consultation.id)

# End PatientDentalProcedure --------------------------------------------------------------------#

# Signup OralPatientProcedure---------------------------------------------------------------------#
@login_required
@odontology_required
def oral_patient_procedure_register(request, consultation_id):
	template_name = 'odontology/patient/consult_patient.html'
	consultation = Consultation.objects.get(pk=consultation_id)
	dentist = Dentist.objects.get(pk=request.user.id)
	# Save 
	if request.method == 'POST':
		# Patient Dental Procedure
		form_oral_patient_procedure = OralPatientProcedureForm(request.POST) # empty form
		if form_oral_patient_procedure.is_valid():
			oral_patient_procedure = form_oral_patient_procedure.save(commit=False)
			oral_patient_procedure.dentist = dentist # Adiciono o denstista ao form
			oral_patient_procedure.consultation = consultation # Adiciono o Patient ao form
			oral_patient_procedure.save()

	context = {'tab_oral': True}
	return TemplateResponse(request, template_name, context)

@login_required
def oral_patient_procedure_delete(request, oral_patient_procedure_id):
	oral_patient_procedure = OralPatientProcedure.objects.get(pk=oral_patient_procedure_id)
	consultation=oral_patient_procedure.consultation
	oral_patient_procedure.delete()
	return redirect('consultation_edit', consultation_id=consultation.id)

# End OralPatientProcedure ----------------------------------------------------------------------#

# Signup Consultation----------------------------------------------------------------------------#
@login_required
def consultation_index(request):
	template_name = 'odontology/consultation/consultation_index.html'
	""" A View of all Consultation """
	consultations_list = Consultation.objects.all()
	

	""" takes the pacient name through and get stored in the variable var_get_search""" 
	var_get_search = request.GET.get('search_box')
	if var_get_search is not None:
		consultations_list = consultations_list.filter(patient__name__icontains=var_get_search)
	else:
		# Exibe somente as consultas do dia
		consultation_date = date.today() # Pega sempre a data atual
		consultations_list = consultations_list.filter(created_on__date=consultation_date)

	paginator = Paginator(consultations_list, 50) # Mostra 50 pacientes por página

	# Make sure page request is an int. If not, deliver first page.
	# Esteja certo de que o `page request` é um inteiro. Se não, mostre a primeira página.
	try:
		page = int(request.GET.get('page', '1'))
	except ValueError:
		page = 1

	# Se o page request (9999) está fora da lista, mostre a última página.
	try:
		consultations = paginator.page(page)
	except (EmptyPage, InvalidPage):
		consultations = paginator.page(paginator.num_pages)

	context = {'consultations': consultations}
	return render(request, template_name, context)

@login_required
def consultation_create(request):
	dentist = Dentist.objects.get(pk=request.user.id)
	form = ConsultationForm # empty form
	
	if request.method == 'POST':
		form=ConsultationForm(request.POST)
		if(form.is_valid()):
			consult = consultation=form.save(commit=False)
			consult.dentist = dentist
			consult.save()
			return redirect('consultation_edit',consultation_id=consultation.id)
	return render(request, 'odontology/consultation/consultation_register.html', {'form':form})

@login_required
def consultation_show(request, consultation_id):
	template_name = 'odontology/consultation/consultation_show.html' 
	consultation = Consultation.objects.get(pk=consultation_id)
	context = {'consultation': consultation}
	return render(request, template_name, context)

@login_required
def consultation_delete(request, consultation_id):
	consultation = Consultation.objects.get(pk=consultation_id)
	consultation.delete()
	return redirect('consultation_index')

# End Consultation-------- ----------------------------------------------------------------------#

# Signup Exams ----------------------------------------------------------------------------------#
@permission_required('odontology.exams_index',raise_exception=True)
@login_required
def exams_index(request):
	template_name = 'odontology/exams/exams_index.html'
	exams = Exams.objects.all()
	context = { 'exams': exams }
	return render(request, template_name, context)

# New e Edit - Exams 
@permission_required('odontology.exams_register',raise_exception=True)
@login_required
def exams_register(request, exams_id=None):

	if exams_id: # Edit
		exams = Exams.objects.get(pk=exams_id)
		form_exams = ExamsForm(instance=exams)
	else: # New
		form_exams = ExamsForm
		exams = None

	# Save 
	if request.method == 'POST':
		if exams_id: # Edit
			form_exams = ExamsForm(request.POST, instance=exams)
			if form_exams.is_valid():
				form_exams.save()
				return redirect('exams_index')
		else: # New
			form_exams = ExamsForm(request.POST)
			if form_exams.is_valid():
				form_exams.save()
				return redirect('exams_index')

	return render(request, 'odontology/exams/exams_register.html', {'form_exams': form_exams, 'exams': exams})

@permission_required('odontology.course_show',raise_exception=True)
@login_required
def exams_show(request, exams_id):
	exams = Exams.objects.get(pk=exams_id)
	return render(request, 'odontology/exams/exams_show.html', {'exams': exams})

@permission_required('odontology.exams_delete',raise_exception=True)
@login_required
def exams_delete(request, exams_id):
	exams = Exams.objects.get(pk=exams_id)
	exams.delete()
	return redirect('exams_index')

# End Exams -------------------------------------------------------------------------------------#

# Signup Exams Solicitation----------------------------------------------------------------------#
@login_required
@odontology_required
def examination_solicitation_register(request, consultation_id, examination_solicitation_id=None):
	consultation = Consultation.objects.get(pk=consultation_id)
	# Save 
	if request.method == 'POST':
		# Exams
		form_examination_solicitation = ExaminationSolicitationForm(request.POST) # empty form
		if form_examination_solicitation.is_valid():
			exam = form_examination_solicitation.save(commit=False)
			exam.consultation = consultation # Adiciono o consultation ao form
			exam.save()
	
	return TemplateResponse(request, 'odontology/patient/consult_patient.html', {'tab_exams': True})

@login_required
def examination_solicitation_delete(request, examination_solicitation_id):
	examination_solicitation = ExaminationSolicitation.objects.get(pk=examination_solicitation_id)
	consultation=examination_solicitation.consultation
	examination_solicitation.delete()
	return redirect('consultation_edit', consultation_id=consultation.id)

# End Exams Solicitation ------------------------------------------------------------------------#

# Signup report_service--------------------------------------------------------------------------#
@login_required
def report_service(request):
	
	""" A View of all Consultation """
	consultations = Consultation.objects.all()

	""" takes the pacient name through and get stored in the variable var_get_search""" 
	consultation_date = date.today() # Pega sempre a data atual

	if request.GET.get('search_box', False):
		consultation_date = datetime.strptime(request.GET.get('search_box'), "%Y-%m-%d").date()

	if consultation_date is not None:
		consultations = consultations.filter(created_on__date=consultation_date)
		
	return render(request, 'odontology/consultation/consultation_report_service.html', {'consultations': consultations, 'consultation_date': consultation_date })

# End report_service------ ----------------------------------------------------------------------#

# Signup report_annual_quantitative---------------------------------------------------------------#
@login_required
def report_annual_quantitative(request):
	
	""" A View of all Consultation """
	consultations = Consultation.objects.all()
	""" Inicializa as variaveis consultation_from, consultation_to e genres """
	consultation_from = None
	consultation_to = None
	categories = {'estudante': 0, 'professor': 0, 'tecnico_administrativo': 0, 'dependente': 0, 'terceirizado': 0, 'total_categoria': 0}
	genres = {'feminino': 0, 'masculino': 0, 'total_genero': 0}
	age_groups = {'lower_seventeen_years': 0, 'seventeen_thirty_years': 0, 'most_thirty_years': 0, 'total_faixa_etaria': 0}
	procedures = {'attendance': 0, 'not_attendance': 0, 'lack_justified': 0, 'first_consultation': 0, 'return_consultation': 0, 'urgency_consultation': 0, 'completed_treatment': 0, 'radiograph': 0,  'clinical_examination': 0, 'tartarectomia': 0, 'profilaxia':0, 'fluor': 0, 'remocao_de_pontos': 0, 'rest_ionomero': 0, 'rest_amalgama': 0, 'rest_resina': 0, 'rest_provisoria': 0, 'drenagem_de_absesso': 0, 'instrucao_de_higiene_oral': 0, 'abertura_coronaria_medicacao': 0, 'exodontia': 0, 'solictacao_ex': 0, 'total_proc': 0}
	
	if request.GET.get('search_from') and request.GET.get('search_to') is not None:
		consultation_from = datetime.strptime(request.GET.get('search_from')+" 00:00:00", "%Y-%m-%d %H:%M:%S")
		consultation_to = datetime.strptime(request.GET.get('search_to')+" 23:59:59", "%Y-%m-%d %H:%M:%S")
		# You can use range anywhere you can use BETWEEN in SQL — for dates, numbers and even characters.
		consultations = consultations.filter(created_on__gte=consultation_from, created_on__lte=consultation_to)
		
		for consultation in consultations:

			# Categorias
			if consultation.patient.types == 'Estudante':
				categories['estudante'] += 1
			if consultation.patient.types == 'Professor':
				categories['professor'] += 1
			if consultation.patient.types == 'Técnico Administrativo':
				categories['tecnico_administrativo'] += 1
			if consultation.patient.types == 'Dependente':
				categories['dependente'] += 1
			if consultation.patient.types == 'Terceirizado':
				categories['terceirizado'] += 1
			categories['total_categoria'] += 1
			
			# Genero			
			if consultation.patient.sex == 'F':
				genres['feminino'] += 1
			if consultation.patient.sex == 'M':
				genres['masculino'] += 1
			genres['total_genero'] += 1

			# Faixa Etária
			if consultation.patient.age(consultation) < 17:
				age_groups['lower_seventeen_years'] += 1
			if consultation.patient.age(consultation) >= 17 and consultation.patient.age(consultation) <= 30:
				age_groups['seventeen_thirty_years'] += 1
			if consultation.patient.age(consultation) > 30:
				age_groups['most_thirty_years'] += 1
			age_groups['total_faixa_etaria'] += 1

			# Procedimentos
			if consultation.attendance == True:
				procedures['attendance'] += 1
			else:
				procedures['not_attendance'] += 1

			if consultation.lack_justified == True:
				procedures['lack_justified'] += 1

			if consultation.first_consultation == True:
				procedures['first_consultation'] += 1

			if consultation.return_consultation == True:
				procedures['return_consultation'] += 1

			if consultation.urgency_consultation == True:
				procedures['urgency_consultation'] += 1

			if consultation.completed_treatment == True:
				procedures['completed_treatment'] += 1

			if consultation.radiograph == True:
				procedures['radiograph'] += 1

			if consultation.clinical_examination == True:
				procedures['clinical_examination'] += 1

			if consultation.examinationsolicitation_set.count() > 0:
				procedures['solictacao_ex'] += 1

			for p in consultation.oralpatientprocedure_set.all():
				if p.oral_procedure.name == 'Tartarectomia':
					procedures['tartarectomia'] += 1
				if p.oral_procedure.name == 'Profilaxia':
					procedures['profilaxia'] += 1
				if p.oral_procedure.name == 'Flúor':
					procedures['fluor'] += 1
				if p.oral_procedure.name == 'Remoção de Pontos':
					procedures['remocao_de_pontos'] += 1
				if p.oral_procedure.name == 'Drenagem de Absesso':
					procedures['drenagem_de_absesso'] += 1
				if p.oral_procedure.name == 'Instrução de Higiene Oral':
					procedures['instrucao_de_higiene_oral'] += 1
				if p.oral_procedure.name == 'Abertura Coronária + Medicação':
					procedures['abertura_coronaria_medicacao'] += 1
				if p.oral_procedure.name == 'Exodontia':
					procedures['exodontia'] += 1

			for dpc in consultation.patientdentalprocedure_set.all():
				if dpc.procedure_dental.name == 'Restauração Ionômero' and not dpc.evaluation:
					procedures['rest_ionomero'] += 1
				if dpc.procedure_dental.name == 'Restauração Amalgama' and not dpc.evaluation:
					procedures['rest_amalgama'] += 1
				if dpc.procedure_dental.name == 'Restauração Resina' and not dpc.evaluation:
					procedures['rest_resina'] += 1
				if dpc.procedure_dental.name == 'Restauração Provisória' and not dpc.evaluation:
					procedures['rest_provisoria'] += 1
				if dpc.procedure_dental.name == 'Extraído ou ausente' and not dpc.evaluation:
					procedures['exodontia'] += 1

	# Total de todos os procedimentos
	total = 0
	for procedure in procedures:
		total += procedures[procedure]
	procedures['total_proc'] = total

	return render(request, 'odontology/consultation/consultation_report_annual_quantitative.html', {'consultations': consultations, 'consultation_from': consultation_from, 'consultation_to': consultation_to, 'procedures': procedures, 'categories': categories, 'genres': genres, 'age_groups': age_groups })

# End report_annual_quantitative----------------------------------------------------------------------#

# Incluir os dentens deciduos nos patient ja cadastrados
# def update_patient_tooth(request):
# 	teeths = Tooth.objects.all() # find all teeth
# 	for patient in Patient.objects.all():
# 		for tooth in teeths:
# 			if not patient.patienttooth_set.filter(tooth=tooth).exists():
# 				patient_tooth = PatientTooth(tooth=tooth, patient=patient)
# 				patient_tooth.save()

# 	return HttpResponse('<h1><center>Inclusão dos dentes DECIDUOS realizada com sucesso</center><h1>')