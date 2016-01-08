# -*- coding: utf-8 -*-

#Django IMports
from django.db import models
from django.contrib.auth.models import User

class AuditModel(models.Model):
	# Audit Fields
	created_on = models.DateTimeField(u'Criado em', auto_now_add=True)
	updated_on = models.DateTimeField(u'Autalizado em', auto_now=True)

	class Meta:
		abstract=True

# Create your models here.
class Dentist(User, AuditModel):
	
	MALE = 'M'
	FEMALE  = 'F'
	SEX_CHOICES = ((MALE, 'Masculino'), (FEMALE, 'Feminino'),)
	sex = models.CharField(u'Sexo', max_length=1, choices=SEX_CHOICES, default=FEMALE)
	
	def is_upperclass(self):
		return self.sex in (self.MALE, self.FEMALE)

	MARRIED = 'CASADO'
	SINGLE = 'SOLTEIRO'
	SEPARATED = 'SEPARADO'
	WINDOWER = 'VIUVO'
	DIVORCED = 'DIVORCIADO'
	MARITAL_STATUS_CHOICES = ((MARRIED, 'Casado'), (SINGLE, 'Solteiro'), (SEPARATED, 'Seprado'), (WINDOWER, 'Viuvo'), (DIVORCED, 'Divorciado'),)
	marital_status = models.CharField(u'Estado Cívil', max_length=10, choices=MARITAL_STATUS_CHOICES, default=SINGLE)
	
	def is_upperclass(self):
		return self.marital_status in (self.MARRIED, self.SINGLE, self.SEPARATED, self.WINDOWER, self.DIVORCED)

	birth_date = models.DateField(u'Data Nascimento')
	cro = models.CharField(u'CRO', max_length=6, null=False,)
	phone = models.CharField(u'Telefone', max_length=14, blank=True)

	def __str__(self): 
		return self.sex

class Address(AuditModel):
	city = models.CharField(u'Cidade', max_length=255)
	state = models.CharField(u'UF', max_length=2, blank=True)
	street = models.CharField(u'Rua',max_length=255)
	number = models.CharField(u'Número', max_length=20)
	complement = models.CharField(u'Complemento', max_length=255, blank=True)
	zip_code = models.CharField(u'CEP', max_length=10)
	reference_point = models.CharField(u'Ponto de Referência', max_length=255, blank=True)
	neighborhood = models.CharField(u'Bairro', max_length=255)
	country = models.CharField(u'País', max_length=255, blank=True)
	dentist = models.ForeignKey(Dentist)

class Course(AuditModel):
	name = models.CharField(u'Nome', max_length=50)
	description = models.CharField(u'Descrição', max_length=100)

	def __str__(self):
		return self.name