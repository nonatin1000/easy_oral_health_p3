# -*- coding: utf-8 -*-

from django.forms import ModelForm
from django.forms.utils import ErrorList
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from odontology.models import Dentist, Address, Course, Tooth, ToothDivision, Patient, PatientTooth, ProcedureDental, OralProcedure, PatientDentalProcedure, OralPatientProcedure, Consultation

class DentistForm(UserCreationForm):

	class Meta:
		model = Dentist
		fields = ['username', 'first_name', 'last_name', 'email', 'sex', 'cro', 'marital_status', 'birth_date', 'phone']

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

	class Meta:
		model = Consultation
		fields = ('__all__')
		# labels = {
		# 	'oral_procedure': 'Procedimento',
		# }