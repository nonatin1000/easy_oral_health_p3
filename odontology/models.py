# -*- coding: utf-8 -*-

from django.db import models

class Dentista(models.Model):
	
	nome = models.CharField(
		max_length=100,
		null=False
	)

	MASCULINO = 'M'
	FEMININO  = 'F'
	SEXO_CHOICES = (
				        (MASCULINO, 'Masculino'),
				        (FEMININO, 'Feminino'),
    )
	sexo = models.CharField(
    						max_length=1,
                            choices=SEXO_CHOICES,
                            default=FEMININO
    )
	def is_upperclass(self):
		return self.sexo in (self.MASCULINO, self.FEMININO)

	CASADO = 'CASADO'
	SOLTEIRO = 'SOLTEIRO'
	SEPARADO = 'SEPARADO'
	VIUVO = 'VIUVO'
	DIVORCIADO = 'DIVORCIADO'
	ESTADO_CIVIL_CHOICES = (
        (CASADO, 'Casado'),
        (SOLTEIRO, 'Solteiro'),
        (SEPARADO, 'Seprado'),
        (VIUVO, 'Viuvo'),
        (DIVORCIADO, 'Divorciado'),
    )
	estado_civil = models.CharField(
										max_length=10,
                                  		choices=ESTADO_CIVIL_CHOICES,
                                 		default=SOLTEIRO
    )
	def is_upperclass(self):
		return self.estado_civil in (self.CASADO, self.SOLTEIRO, self.SEPARADO, self.VIUVO, self.DIVORCIADO)

	data_nascimento = models.DateField()
	cro = models.CharField(
		max_length=6,
		null=False,
	)
	email = models.EmailField(
		max_length=254,
		blank=True
	)
	uf = models.CharField(
		max_length=2,
		blank=True
	)
	cidade = models.CharField(
		max_length=30,
		blank=True
	)
	bairro = models.CharField(
		max_length=30,
		blank=True
	)
	rua = models.CharField(
		max_length=50,
		blank=True
	)
	numero = models.CharField(
		max_length=20,
		blank=True
	)
	cep = models.CharField(
		max_length=10,
		blank=True
	)

	def __unicode__(self):
		return nome