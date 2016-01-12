# -*- coding: utf-8 -*-

#Django IMports
from django.db import models
from django.contrib.auth.models import User
from django.contrib.contenttypes.fields import GenericForeignKey, GenericRelation
from django.contrib.contenttypes.models import ContentType

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
	address = GenericRelation('Address')

	def __str__(self): 
		return self.sex


class Course(AuditModel):
	name = models.CharField(u'Nome', max_length=50)
	description = models.CharField(u'Descrição', max_length=100, blank=True)

	def __str__(self):
		return self.name

class ToothStatus(AuditModel):
	name = models.CharField(u'Nome', max_length=50)
	description = models.CharField('Descrição', max_length=100, blank=True)

	def __str__(self):
		return self.name

class Tooth(AuditModel):
	name = models.CharField(u'Nome', max_length=50)
	description = models.CharField(u'Descrição', max_length=100)

	def __str__(self):
		return self.name

class ToothDivision(AuditModel):
	name = models.CharField(u'Nome', max_length=50)
	description = models.CharField(u'Descrição', max_length=100)

	def __str__(self):
		return self.name

class ProcedureStatus(AuditModel):
	name = models.CharField(u'Nome', max_length=50)
	description = models.CharField(u'Descrição', max_length=100)

	def __str__(self):
		return self.name

class Patient(AuditModel):
	name = models.CharField(u'Nome', max_length=150)
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

	birth_date = models.DateField(u'Data de Nascimento', blank=True)
	father = models.CharField(u'Pai', max_length=150, blank=True)
	mother = models.CharField(u'Mãe', max_length=150, blank=True)
	phone = models.CharField(u'Telefone', max_length=14, blank=True)
	course = models.ForeignKey(Course, blank=True)

	STUDENT = 'Estudante'
	EMPLOYEE = 'Funcionário'
	TYPES_CHOICES = ((STUDENT, 'Estudante'), (EMPLOYEE, 'Funcionário'),)
	types = models.CharField(u'Tipo', max_length=20, choices=TYPES_CHOICES, default=STUDENT)
	email = models.EmailField(u'E-mail')
	dependents = models.ManyToManyField('self', symmetrical=False)
	address = GenericRelation('Address')

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
	
	# Generic Relation
	content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
	object_id = models.PositiveIntegerField(db_index=True)
	content_object = GenericForeignKey('content_type', 'object_id')