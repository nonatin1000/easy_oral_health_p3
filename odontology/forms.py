# -*- coding: utf-8 -*-

from django.forms import ModelForm
from odontology.models import Dentista

class DentistaForm(ModelForm):

	class Meta:
		model = Dentista
		fields = '__all__'