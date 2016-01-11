# -*- coding: utf-8 -*-

from django.forms import ModelForm
from django.contrib.auth.models import User
from odontology.models import Dentist, Address, Course, ToothStatus, Tooth, ToothDivision, ProcedureStatus

class DentistForm(ModelForm):

	class Meta:
		model = Dentist
		fields = ['username', 'password', 'first_name', 'last_name', 'email', 'sex', 'cro', 'marital_status', 'birth_date', 'phone']

class AddressForm(ModelForm):

	class Meta:
		model = Address
		exclude = ['dentist']

class CourseForm(ModelForm):

	class Meta:
		model = Course
		fields = '__all__'

class ToothStatusForm(ModelForm):

	class Meta:
		model = ToothStatus
		fields = '__all__'

class ToothForm(ModelForm):

	class Meta:
		model = Tooth
		fields = '__all__'

class ToothDivisionForm(ModelForm):

	class Meta:
		model = ToothDivision
		fields = '__all__'

class ProcedureStatusForm(ModelForm):

	class Meta:
		model = ProcedureStatus
		fields = '__all__'
