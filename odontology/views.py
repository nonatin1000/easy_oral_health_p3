# -*- coding: utf-8 -*-

from django.shortcuts import render, redirect, get_object_or_404
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

def dentist_edit(request, dentist_id):
	dentist = get_object_or_404(Dentist, id=dentist_id)
	
	if request.method == 'POST':
		form = DentistForm(request.POST, instance=dentist)
		if form.is_valid():
			form.save()
			return redirect('dentist_index')
	else:
		form = DentistForm(instance=dentist)

	return render(request, 'odontology/dentist/dentist_edit.html', {'form': form, 'dentist': dentist })
	
def dentist_show(request, dentist_id):
	dentist = Dentist.objects.get(id=dentist_id)
	return render(request, 'odontology/dentist/dentist_show.html', {'dentist': dentist})

def dentist_delete(request, dentist_id):
	dentist = Dentist.objects.get(id=dentist_id)
	dentist.delete()
	return redirect('dentist_index')
