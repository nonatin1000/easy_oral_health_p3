# -*- coding: utf-8 -*-

from django.forms import ModelForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from odontology.models import Dentist, Address, Course, Tooth, ToothDivision, Patient, PatientTooth, ProcedureDental, OralProcedure, PatientDentalProcedure, OralPatientProcedure

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

class OralPatientProcedureForm(ModelForm):

	class Meta:
		model = OralPatientProcedure
		fields = ['patient', 'oral_procedure']
		labels = {
			'patient': 'Paciente',
			'oral_procedure': 'Procedimento',
		}