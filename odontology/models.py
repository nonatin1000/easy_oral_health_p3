# -*- coding: utf-8 -*-

#Django IMports
from django.db import models
from django.db.models import signals
from django.contrib.auth.models import User
from django.contrib.contenttypes.fields import GenericForeignKey, GenericRelation
from django.contrib.contenttypes.models import ContentType
import datetime
from datetime import date

class AuditModel(models.Model):
	# Audit Fields
	created_on = models.DateTimeField('Criado em', auto_now_add=True)
	updated_on = models.DateTimeField('Autalizado em', auto_now=True)

	class Meta:
		abstract=True

# Create your models here.
class Dentist(User, AuditModel):
	
	MALE = 'M'
	FEMALE  = 'F'
	SEX_CHOICES = ((MALE, 'Masculino'), (FEMALE, 'Feminino'),)
	sex = models.CharField('Sexo', max_length=1, choices=SEX_CHOICES, default=FEMALE)
	
	def is_upperclass(self):
		return self.sex in (self.MALE, self.FEMALE)

	MARRIED = 'CASADO'
	SINGLE = 'SOLTEIRO'
	SEPARATED = 'SEPARADO'
	WINDOWER = 'VIUVO'
	DIVORCED = 'DIVORCIADO'
	MARITAL_STATUS_CHOICES = ((MARRIED, 'Casado'), (SINGLE, 'Solteiro'), (SEPARATED, 'Separado'), (WINDOWER, 'Viúvo'), (DIVORCED, 'Divorciado'),)
	marital_status = models.CharField('Estado Cívil', max_length=10, choices=MARITAL_STATUS_CHOICES, default=SINGLE)
	
	def is_upperclass(self):
		return self.marital_status in (self.MARRIED, self.SINGLE, self.SEPARATED, self.WINDOWER, self.DIVORCED)

	birth_date = models.DateField('Data Nascimento')
	cro = models.CharField('CRO', max_length=6, null=False,)
	specialty = models.CharField('Especialidade', max_length=50, null=False,)
	phone = models.CharField('Telefone', max_length=16)
	address = GenericRelation('Address')

	def __str__(self): 
		return self.first_name

class Course(AuditModel):
	name = models.CharField('Nome', max_length=50, help_text='Este campo é obrigatório')
	description = models.CharField('Descrição', max_length=100, blank=True)

	def __str__(self):
		return self.name

class Tooth(AuditModel):
	name = models.CharField('Nome', max_length=50)
	description = models.CharField('Descrição', max_length=100)

	def __str__(self):
		return self.name

class ToothDivision(AuditModel):
	name = models.CharField('Nome', max_length=50)
	description = models.CharField('Descrição', max_length=100)

	def __str__(self):
		return self.name

class Patient(AuditModel):
	name = models.CharField('Nome', max_length=150)
	MALE = 'M'
	FEMALE  = 'F'
	SEX_CHOICES = ((MALE, 'Masculino'), (FEMALE, 'Feminino'),)
	sex = models.CharField('Sexo', max_length=1, choices=SEX_CHOICES)
	
	def is_upperclass(self):
		return self.sex in (self.MALE, self.FEMALE)

	MARRIED = 'CASADO'
	SINGLE = 'SOLTEIRO'
	SEPARATED = 'SEPARADO'
	WINDOWER = 'VIUVO'
	DIVORCED = 'DIVORCIADO'
	MARITAL_STATUS_CHOICES = ((MARRIED, 'Casado'), (SINGLE, 'Solteiro'), (SEPARATED, 'Seprado'), (WINDOWER, 'Viuvo'), (DIVORCED, 'Divorciado'),)
	marital_status = models.CharField('Estado Cívil', max_length=10, choices=MARITAL_STATUS_CHOICES, default=None, blank=True, null=True)
	
	def is_upperclass(self):
		return self.marital_status in (self.MARRIED, self.SINGLE, self.SEPARATED, self.WINDOWER, self.DIVORCED)

	birth_date = models.DateField('Data de Nascimento')
	father = models.CharField('Pai', max_length=150, blank=True, null=True)
	mother = models.CharField('Mãe', max_length=150, blank=True, null=True)
	phone = models.CharField('Telefone', max_length=16)
	course = models.ForeignKey(Course, null=True, blank=True)

	STUDENT = 'Estudante'
	TEACHER = 'Professor'
	ADMNISTRATIVE_TECHNICIAN = 'Técnico Administrativo'
	DEPENDENT = 'Dependente'
	OUTSOURCED = 'Terceirizado'
	TYPES_CHOICES = ((STUDENT, 'Estudante'), (TEACHER, 'Professor'), (ADMNISTRATIVE_TECHNICIAN, 'Técnico Administrativo'), (OUTSOURCED, 'Terceirizado'), (DEPENDENT, 'Dependente'),)
	types = models.CharField('Tipo', max_length=25, choices=TYPES_CHOICES, default=STUDENT)
	email = models.EmailField('E-mail', blank=True, null=True)
	dependents = models.ManyToManyField('self', symmetrical=False)
	address = GenericRelation('Address')
	
	# calculating age
	def age(self, consultation):
		
		return consultation.created_on.year - self.birth_date.year

	def __str__(self):

		return self.name

	class Meta:
		verbose_name = 'Paciente'
		verbose_name_plural = 'Pacientes'
		ordering = ['-created_on']


class Address(AuditModel):
	city = models.CharField('Cidade', max_length=255)
	state = models.CharField('UF', max_length=2)
	street = models.CharField('Rua',max_length=255)
	number = models.CharField('Número', max_length=20)
	complement = models.CharField('Complemento', max_length=255, blank=True, null=True)
	zip_code = models.CharField('CEP', max_length=10, blank=True, null=True)
	reference_point = models.CharField('Ponto de Referência', max_length=255, blank=True, null=True)
	neighborhood = models.CharField('Bairro', max_length=255)
	country = models.CharField('País', max_length=255, default='Brasil')
	
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
	name = models.CharField('Nome', max_length=50)
	description = models.CharField('Descrição', max_length=100, blank=True, null=True)

	def __str__(self):
		return self.name

class OralProcedure(AuditModel):
	name = models.CharField('Nome', max_length=50)
	description = models.CharField('Descrição', max_length=100, blank=True, null=True)

	def __str__(self):
		return self.name

class Consultation(AuditModel):
	patient = models.ForeignKey(Patient, related_name='consultation_patient')
	dentist = models.ForeignKey(Dentist, related_name='consultation_dentist')
	attendance = models.BooleanField()
	lack_justified = models.BooleanField()
	first_consultation = models.BooleanField()
	return_consultation = models.BooleanField()
	urgency_consultation = models.BooleanField()
	completed_treatment = models.BooleanField()
	radiograph = models.BooleanField()
	clinical_examination = models.TextField(blank=True, null=True)

	# Verifica os procedimentos bucal e armeza o valor no dicionario para exibição no relatorio de atendimento
	def oral_proc(self):
		oral_procedures = {}
		for oprocedure in self.oralpatientprocedure_set.all():
			if oprocedure.oral_procedure.name == 'Tartarectomia':
				oral_procedures['tartarectomia'] = True
			if oprocedure.oral_procedure.name == 'Profilaxia':
				oral_procedures['profilaxia'] = True
			if oprocedure.oral_procedure.name == 'Flúor':
				oral_procedures['fluor'] = True
			if oprocedure.oral_procedure.name == 'Remoção de Pontos':
				oral_procedures['remocao_de_pontos'] = True
			if oprocedure.oral_procedure.name == 'Drenagem de Absesso':
				oral_procedures['drenagem_de_absesso'] = True
			if oprocedure.oral_procedure.name == 'Instrução de Higiene Oral':
				oral_procedures['instrucao_de_higiene_oral'] = True
			if oprocedure.oral_procedure.name == 'Abertura Coronária + Medicação':
				oral_procedures['abertura_coronaria_medicacao'] = True
			if oprocedure.oral_procedure.name == 'Exodontia':
				oral_procedures['exodontia'] = True
			
		return oral_procedures

	# Verifica os procedimentos dental e armeza o valor no dicionario para exibição no relatorio de atendimento
	def dental_proc(self):
		dental_procedures = {}
		
		for pprocedure in self.patientdentalprocedure_set.all():
			if pprocedure.procedure_dental.name == 'Restauração Ionômero':
				dental_procedures['rest_ionomero'] = True
			if pprocedure.procedure_dental.name == 'Restauração Amalgama':
				dental_procedures['rest_amalgama'] = True
			if pprocedure.procedure_dental.name == 'Restauração Resina':
				dental_procedures['rest_resina'] = True
			if pprocedure.procedure_dental.name == 'Restauração Provisória':
				dental_procedures['rest_provisoria'] = True
			if pprocedure.procedure_dental.name == 'Extraído ou ausente':
				dental_procedures['exodontia'] = True
		return dental_procedures

	# Procedimentos Dental que são da AVALIAÇÃO
	def dental_proc_evaluation(self):
		dental_procedures_evaluation = {}
		for pprocedureevaluation in self.patientdentalprocedure_set.all():
			if pprocedureevaluation.procedure_dental.name == 'Restauração Ionômero' and not pprocedureevaluation.evaluation:
				dental_procedures_evaluation['rest_ionomero_evaluation'] = True
			if pprocedureevaluation.procedure_dental.name == 'Restauração Amalgama' and not pprocedureevaluation.evaluation:
				dental_procedures_evaluation['rest_amalgama_evaluation'] = True
			if pprocedureevaluation.procedure_dental.name == 'Restauração Resina' and not pprocedureevaluation.evaluation:
				dental_procedures_evaluation['rest_resina_evaluation'] = True
			if pprocedureevaluation.procedure_dental.name == 'Restauração Provisória' and not pprocedureevaluation.evaluation:
				dental_procedures_evaluation['rest_provisoria_evaluation'] = True
			if pprocedureevaluation.procedure_dental.name == 'Extraído ou ausente_evaluation' and not pprocedureevaluation.evaluation:
				dental_procedures_evaluation['exodontia_evaluation'] = True

		return dental_procedures_evaluation

	def __str__(self):
		
		return self.patient.name

	class Meta:
		verbose_name = 'Consulta'
		verbose_name_plural = 'Consultas'
		ordering = ['-created_on']

class Exams(AuditModel):
	name = models.CharField(max_length=150)
	description = models.CharField('Descrição', max_length=150, blank=True, null=True)
	
	def __str__(self):
		
		return self.name

class ExaminationSolicitation(AuditModel):
	exams = models.ForeignKey(Exams,null=True,blank=True)
	consultation = models.ForeignKey(Consultation,null=True,blank=True)
	appraisal = models.TextField(blank=True, null=True)
	
	def __str__(self):
		
		return self.exams.name

class PatientDentalProcedure(AuditModel):
	patient_tooth = models.ForeignKey(PatientTooth, related_name='patient_dental_procedure')
	tooth_division = models.ForeignKey(ToothDivision)
	procedure_dental = models.ForeignKey(ProcedureDental)
	dentist = models.ForeignKey(Dentist)
	consultation = models.ForeignKey(Consultation,null=True,blank=True)
	evaluation = models.BooleanField(default=False)

	def __str__(self):
		return self.patient_tooth.tooth.name

	class Meta:
		verbose_name = 'Procedimento Dental'
		verbose_name_plural = 'Procedimentos Dental'
		ordering = ['-created_on']

class OralPatientProcedure(AuditModel):
	oral_procedure = models.ForeignKey(OralProcedure)
	dentist = models.ForeignKey(Dentist)
	consultation = models.ForeignKey(Consultation,null=True,blank=True)

	def __str__(self):
		
		return self.oral_procedure.name

