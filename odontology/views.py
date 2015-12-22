# -*- coding: utf-8 -*-

from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from .models import Dentist
from .forms import DentistForm


def dentist_index(request):
	dentists = Dentist.objects.all()
	return render(request, 'odontology/dentist/dentist_index.html', { 'dentists': dentists })

def dentist_add(request):
	if request.method == 'POST':
		form = DentistForm(request.POST)
		if form.is_valid():
			form.save()
			return redirect('dentist_index')
	else:
		form = DentistForm()

	return render(request, 'odontology/dentist/dentist_add.html', {'form': form })