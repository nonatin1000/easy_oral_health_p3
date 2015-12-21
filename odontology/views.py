# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from odontology.models import Dentist
from odontology.forms import DentistForm

def index(request):

	dentist = Dentist.objects.all()
	
	if request.method == 'POST':
		form = DentistForm(request.POST)
		if form.is_valid():
			form.save()
			return HttpResponseRedirect(reverse('index'))
	else:
		form = DentistForm()

	return render(request, 'index.html', { 'dentist': dentist, 'form': form })