# -*- coding: utf-8 -*-

from django.forms import ModelForm
from odontology.models import Dentist

class DentistForm(ModelForm):

	class Meta:
		model = Dentist
		fields = '__all__'