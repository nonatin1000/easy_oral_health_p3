# -*- coding: utf-8 -*-

#Django IMports
from django.db import models
from django.db.models import signals
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
	MARITAL_STATUS_CHOICES = ((MARRIED, 'Casado'), (SINGLE, 'Solteiro'), (SEPARATED, 'Separado'), (WINDOWER, 'Viúvo'), (DIVORCED, 'Divorciado'),)
	marital_status = models.CharField(u'Estado Cívil', max_length=10, choices=MARITAL_STATUS_CHOICES, default=SINGLE)
	
	def is_upperclass(self):
		return self.marital_status in (self.MARRIED, self.SINGLE, self.SEPARATED, self.WINDOWER, self.DIVORCED)

	birth_date = models.DateField(u'Data Nascimento')
	cro = models.CharField(u'CRO', max_length=6, null=False,)
	phone = models.CharField(u'Telefone', max_length=16, blank=True)
	address = GenericRelation('Address')

	def __str__(self): 
		return self.first_name

class Course(AuditModel):
	name = models.CharField(u'Nome', max_length=50, help_text='Este campo é obrigatório')
	description = models.CharField(u'Descrição', max_length=100, blank=True)

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

class Patient(AuditModel):
	name = models.CharField(u'Nome', max_length=150)
	MALE = 'M'
	FEMALE  = 'F'
	SEX_CHOICES = ((MALE, 'Masculino'), (FEMALE, 'Feminino'),)
	sex = models.CharField(u'Sexo', max_length=1, choices=SEX_CHOICES, default=None, blank=True, null=True)
	
	def is_upperclass(self):
		return self.sex in (self.MALE, self.FEMALE)

	MARRIED = 'CASADO'
	SINGLE = 'SOLTEIRO'
	SEPARATED = 'SEPARADO'
	WINDOWER = 'VIUVO'
	DIVORCED = 'DIVORCIADO'
	MARITAL_STATUS_CHOICES = ((MARRIED, 'Casado'), (SINGLE, 'Solteiro'), (SEPARATED, 'Seprado'), (WINDOWER, 'Viuvo'), (DIVORCED, 'Divorciado'),)
	marital_status = models.CharField(u'Estado Cívil', max_length=10, choices=MARITAL_STATUS_CHOICES, default=None, blank=True, null=True)
	
	def is_upperclass(self):
		return self.marital_status in (self.MARRIED, self.SINGLE, self.SEPARATED, self.WINDOWER, self.DIVORCED)

	birth_date = models.DateField(u'Data de Nascimento', blank=True, null=True)
	father = models.CharField(u'Pai', max_length=150, blank=True, null=True)
	mother = models.CharField(u'Mãe', max_length=150, blank=True, null=True)
	phone = models.CharField(u'Telefone', max_length=16, blank=True, null=True)
	course = models.ForeignKey(Course, null=True, blank=True)

	STUDENT = 'Estudante'
	TEACHER = 'Professor'
	ADMNISTRATIVE_TECHNICIAN = 'Técnico Administrativo'
	DEPENDENT = 'Dependente'
	OUTSOURCED = 'Terceirizado'
	TYPES_CHOICES = ((STUDENT, 'Estudante'), (TEACHER, 'Professor'), (ADMNISTRATIVE_TECHNICIAN, 'Técnico Administrativo'), (OUTSOURCED, 'Terceirizado'), (DEPENDENT, 'Dependente'),)
	types = models.CharField(u'Tipo', max_length=25, choices=TYPES_CHOICES, default=STUDENT)
	email = models.EmailField(u'E-mail')
	dependents = models.ManyToManyField('self', symmetrical=False)
	address = GenericRelation('Address')
	
	def __str__(self):
		return self.name

class Address(AuditModel):
	city = models.CharField(u'Cidade', max_length=255, blank=True, null=True)
	state = models.CharField(u'UF', max_length=2, blank=True, null=True)
	street = models.CharField(u'Rua',max_length=255, blank=True, null=True)
	number = models.CharField(u'Número', max_length=20, blank=True, null=True)
	complement = models.CharField(u'Complemento', max_length=255, blank=True, null=True)
	zip_code = models.CharField(u'CEP', max_length=10, blank=True, null=True)
	reference_point = models.CharField(u'Ponto de Referência', max_length=255, blank=True, null=True)
	neighborhood = models.CharField(u'Bairro', max_length=255, blank=True, null=True)
	country = models.CharField(u'País', max_length=255, blank=True, null=True)
	
	# Generic Relation
	content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
	object_id = models.PositiveIntegerField(db_index=True)
	content_object = GenericForeignKey('content_type', 'object_id')

class PatientTooth(AuditModel):
	tooth = models.ForeignKey(Tooth)
	patient = models.ForeignKey(Patient)

	def __str__(self):
		return self.tooth.name

class ProcedureDental(AuditModel):
	name = models.CharField(u'Nome', max_length=50)
	description = models.CharField(u'Descrição', max_length=100, blank=True, null=True)

	def __str__(self):
		return self.name

class OralProcedure(AuditModel):
	name = models.CharField(u'Nome', max_length=50)
	description = models.CharField(u'Descrição', max_length=100, blank=True, null=True)

	def __str__(self):
		return self.name

class Consultation(AuditModel):
	patient = models.ForeignKey(Patient, related_name='consultation_patient')
	attendance = models.BooleanField()
	observation = models.TextField(blank=True, null=True)

	def __str__(self):
		return self.patient.name

class PatientDentalProcedure(AuditModel):
	patient_tooth = models.ForeignKey(PatientTooth, related_name='patient_dental_procedure')
	tooth_division = models.ForeignKey(ToothDivision)
	procedure_dental = models.ForeignKey(ProcedureDental)
	dentist = models.ForeignKey(Dentist)
	consultation=models.ForeignKey(Consultation,null=True,blank=True)

	def __str__(self):
		return self.patient_tooth.tooth.name

class OralPatientProcedure(AuditModel):
	oral_procedure = models.ForeignKey(OralProcedure)
	dentist = models.ForeignKey(Dentist)
	consultation=models.ForeignKey(Consultation,null=True,blank=True)

	def __str__(self):
		return self.oral_procedure.name

