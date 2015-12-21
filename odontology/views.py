# -*- coding: utf-8 -*-

from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from odontology.models import Dentista
from odontology.forms import DentistaForm

def index(request):

	dentista = Dentista.objects.all()
	
	if request.method == 'POST':
		form = DentistaForm(request.POST)
		if form.is_valid():
			novo_contato = form.save()
			return HttpResponseRedirect(reverse('index'))
	else:
		form = DentistaForm()

	return render(request, 'index.html', { 'dentista': dentista, 'form': form })