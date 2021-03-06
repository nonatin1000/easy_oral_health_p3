# -*- coding: utf-8 -*-

from django.forms import ModelForm
from django import forms
from django.forms.utils import ErrorList
from django.contrib.auth.models import User
from odontology.models import Dentist, Address, Course, Exams, Tooth, ToothDivision, Patient, PatientTooth, ProcedureDental, OralProcedure, PatientDentalProcedure, OralPatientProcedure, Consultation, ExaminationSolicitation
from dal import autocomplete

from django.contrib.auth.forms import UserCreationForm,PasswordResetForm
from django.contrib.auth import authenticate, get_user_model

class DentistForm(UserCreationForm):

	class Meta:
		model = Dentist
		fields = ['username', 'first_name', 'last_name', 'email', 'sex', 'cro', 'specialty', 'marital_status', 'birth_date', 'phone']

class AddressForm(ModelForm):

	class Meta:
		model = Address
		exclude = ['content_type','content_object','object_id']

class CourseForm(ModelForm):

	class Meta:
		model = Course
		fields = '__all__'

class ToothForm(ModelForm):

	class Meta:
		model = Tooth
		fields = '__all__'

class ToothDivisionForm(ModelForm):

	class Meta:
		model = ToothDivision
		fields = '__all__'

class PatientForm(ModelForm):

	class Meta:
		model = Patient
		exclude = ('dependents', 'patient')

class DependentForm(ModelForm):

	class Meta:
		model = Patient
		exclude = ('dependents', 'patient', 'types', 'course')

class PatientToothForm(ModelForm):

	class Meta:
		model = PatientTooth
		fields = '__all__'

class ProcedureDentalForm(ModelForm):

	class Meta:
		model = ProcedureDental
		fields = '__all__'

class OralProcedureForm(ModelForm):

	class Meta:
		model = OralProcedure
		fields = '__all__'

class PatientDentalProcedureForm(ModelForm):

	class Meta:
		model = PatientDentalProcedure
		fields = ['patient_tooth', 'tooth_division', 'procedure_dental']
		labels = {
			'patient_tooth': 'Dentes',
			'tooth_division': 'Divisão',
			'procedure_dental': 'Procedimentos',
		}

	'''
		Initializes from, filtering teeth through the patient as paramentro
	'''
	def __init__(self, *args, **kwargs):
		if 'patient' in kwargs.keys():
			self.patient=kwargs.pop('patient')
		else:
			self.patient = None
		super(PatientDentalProcedureForm,self).__init__(*args,**kwargs)
		if not self.patient:
			self.patient=self.instance.patient_tooth.patient
		self.fields['patient_tooth'].queryset=PatientTooth.objects.filter(patient=self.patient)

	def clean_patient_tooth(self):
		patient_tooth = self.cleaned_data['patient_tooth']
		if patient_tooth.patient.id != self.patient.id:
			raise forms.ValidationError(u'Dente Inválido.')
		return self.cleaned_data['patient_tooth']

class OralPatientProcedureForm(ModelForm):

	class Meta:
		model = OralPatientProcedure
		fields = ['oral_procedure']
		labels = {
			'oral_procedure': 'Procedimento',
		}

class ConsultationForm(ModelForm):
	patient = forms.ModelChoiceField(
		queryset=Patient.objects.all(),
		widget=autocomplete.ModelSelect2(url='patient-autocomplete')
	)
	class Meta:
		model = Consultation
		exclude = ['dentist']
		labels = {
			'patient': 'Paciente',
			'attendance': 'Compareceu?',
			'lack_justified': 'Falta Justificada',
			'first_consultation': 'Primeira Consulta',
			'return_consultation': 'Consulta Retorno',
			'urgency_consultation': 'Consulta Urgência',
			'completed_treatment': 'Tratamento Concluído?',
			'radiograph': 'Radiografia',
			'clinical_examination': 'Exame Clínico',
		}

class ConsultationEditForm(ModelForm):

	class Meta:
		model = Consultation
		fields = ('attendance', 'lack_justified', 'first_consultation', 'return_consultation', 'urgency_consultation', 'completed_treatment', 'radiograph', 'clinical_examination')
		labels = {
			'attendance': 'Compareceu?',
			'lack_justified': 'Falta Justificada',
			'first_consultation': 'Primeira Consulta',
			'return_consultation': 'Consulta Retorno',
			'urgency_consultation': 'Consulta Urgência',
			'completed_treatment': 'Tratamento Concluído?',
			'radiograph': 'Radiografia',
			'clinical_examination': 'Exame Clínico',
		}

class ExamsForm(ModelForm):

	class Meta:
		model = Exams
		fields = '__all__'

class ExaminationSolicitationForm(ModelForm):

	class Meta:
		model = ExaminationSolicitation
		fields = ('exams', 'appraisal')
		labels = {
			'exams': 'Exames',
			'appraisal': 'Laudo',
		}

class ExaminationSolicitationEditForm(ModelForm):

	class Meta:
		model = ExaminationSolicitation
		fields = ('exams', 'appraisal')
		labels = {
			'exams': 'Exames',
			'appraisal': 'Laudo',
		}

class PasswordResetForm(PasswordResetForm):
	def clean_email(self):
		amount = get_user_model()._default_manager.filter(
            email__iexact=self.cleaned_data.get('email'), is_active=True).count()
		if(amount < 1):
			raise forms.ValidationError('Lamentamos, mas não reconhecemos esse endereço de e-mail.')
		return self.cleaned_data.get('email')