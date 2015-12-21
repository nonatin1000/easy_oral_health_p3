# -*- coding: utf-8 -*-

from django.db import models

class Dentist(models.Model):
	
	name = models.CharField(
		u'Nome',
		max_length=100,
		null=False
	)

	MALE = 'M'
	FEMALE  = 'F'
	SEX_CHOICES = (
				        (MALE, 'Masculino'),
				        (FEMALE, 'Feminino'),
    )
	sex = models.CharField(
							u'Sexo',
    						max_length=1,
                            choices=SEX_CHOICES,
                            default=FEMALE
    )
	def is_upperclass(self):
		return self.sex in (self.MALE, self.FEMALE)

	MARRIED = 'CASADO'
	SINGLE = 'SOLTEIRO'
	SEPARATED = 'SEPARADO'
	WINDOWER = 'VIUVO'
	DIVORCED = 'DIVORCIADO'
	MARITAL_STATUS_CHOICES = (
        (MARRIED, 'Casado'),
        (SINGLE, 'Solteiro'),
        (SEPARATED, 'Seprado'),
        (WINDOWER, 'Viuvo'),
        (DIVORCED, 'Divorciado'),
    )
	marital_status = models.CharField(
										u'Estado Cívil',
										max_length=10,
                                  		choices=MARITAL_STATUS_CHOICES,
                                 		default=SINGLE
    )
	def is_upperclass(self):
		return self.marital_status in (self.MARRIED, self.SINGLE, self.SEPARATED, self.WINDOWER, self.DIVORCED)

	birth = models.DateField(u'Data Nascimento')
	cro = models.CharField(
		u'CRO',
		max_length=6,
		null=False,
	)
	email = models.EmailField(
		u'E-mail',
		max_length=254,
		blank=True
	)
	state = models.CharField(
		u'UF',
		max_length=2,
		blank=True
	)
	city = models.CharField(
		u'Cidade',
		max_length=30,
		blank=True
	)
	neighborhood = models.CharField(
		u'Bairro',
		max_length=30,
		blank=True
	)
	street = models.CharField(
		u'Rua',
		max_length=50,
		blank=True
	)
	number = models.CharField(
		u'Número',
		max_length=20,
		blank=True
	)
	zip_code = models.CharField(
		u'CEP',
		max_length=10,
		blank=True
	)

	def __unicode__(self):
		return name