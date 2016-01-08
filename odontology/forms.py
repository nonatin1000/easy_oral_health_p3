# -*- coding: utf-8 -*-

from django.forms import ModelForm
from django.contrib.auth.models import User
from odontology.models import Dentist, Address, Course, ToothStatus

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