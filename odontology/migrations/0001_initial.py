# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-07-08 14:47
from __future__ import unicode_literals

from django.conf import settings
import django.contrib.auth.models
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0007_alter_validators_add_error_messages'),
        ('contenttypes', '0002_remove_content_type_name'),
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('city', models.CharField(max_length=255, verbose_name='Cidade')),
                ('state', models.CharField(max_length=2, verbose_name='UF')),
                ('street', models.CharField(max_length=255, verbose_name='Rua')),
                ('number', models.CharField(max_length=20, verbose_name='Número')),
                ('complement', models.CharField(blank=True, max_length=255, null=True, verbose_name='Complemento')),
                ('zip_code', models.CharField(blank=True, max_length=10, null=True, verbose_name='CEP')),
                ('reference_point', models.CharField(blank=True, max_length=255, null=True, verbose_name='Ponto de Referência')),
                ('neighborhood', models.CharField(max_length=255, verbose_name='Bairro')),
                ('country', models.CharField(default='Brasil', max_length=255, verbose_name='País')),
                ('object_id', models.PositiveIntegerField(db_index=True)),
                ('content_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.ContentType')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Consultation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('attendance', models.BooleanField()),
                ('lack_justified', models.BooleanField()),
                ('first_consultation', models.BooleanField()),
                ('return_consultation', models.BooleanField()),
                ('urgency_consultation', models.BooleanField()),
                ('completed_treatment', models.BooleanField()),
                ('radiograph', models.BooleanField()),
                ('clinical_examination', models.TextField(blank=True, null=True)),
            ],
            options={
                'verbose_name_plural': 'Consultas',
                'ordering': ['-created_on'],
                'verbose_name': 'Consulta',
            },
        ),
        migrations.CreateModel(
            name='Course',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('name', models.CharField(help_text='Este campo é obrigatório', max_length=50, verbose_name='Nome')),
                ('description', models.CharField(blank=True, max_length=100, verbose_name='Descrição')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Dentist',
            fields=[
                ('user_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to=settings.AUTH_USER_MODEL)),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('sex', models.CharField(choices=[('M', 'Masculino'), ('F', 'Feminino')], default='F', max_length=1, verbose_name='Sexo')),
                ('marital_status', models.CharField(choices=[('CASADO', 'Casado'), ('SOLTEIRO', 'Solteiro'), ('SEPARADO', 'Separado'), ('VIUVO', 'Viúvo'), ('DIVORCIADO', 'Divorciado')], default='SOLTEIRO', max_length=10, verbose_name='Estado Cívil')),
                ('birth_date', models.DateField(verbose_name='Data Nascimento')),
                ('cro', models.CharField(max_length=6, verbose_name='CRO')),
                ('specialty', models.CharField(max_length=50, verbose_name='Especialidade')),
                ('phone', models.CharField(max_length=16, verbose_name='Telefone')),
            ],
            options={
                'verbose_name_plural': 'users',
                'abstract': False,
                'verbose_name': 'user',
            },
            bases=('auth.user', models.Model),
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='ExaminationSolicitation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('appraisal', models.TextField(blank=True, null=True)),
                ('consultation', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='odontology.Consultation')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Exams',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('name', models.CharField(max_length=150)),
                ('description', models.CharField(blank=True, max_length=150, null=True, verbose_name='Descrição')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='OralPatientProcedure',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('consultation', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='odontology.Consultation')),
                ('dentist', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='odontology.Dentist')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='OralProcedure',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('name', models.CharField(max_length=50, verbose_name='Nome')),
                ('description', models.CharField(blank=True, max_length=100, null=True, verbose_name='Descrição')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Patient',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('name', models.CharField(max_length=150, verbose_name='Nome')),
                ('sex', models.CharField(choices=[('M', 'Masculino'), ('F', 'Feminino')], max_length=1, verbose_name='Sexo')),
                ('marital_status', models.CharField(blank=True, choices=[('CASADO', 'Casado'), ('SOLTEIRO', 'Solteiro'), ('SEPARADO', 'Seprado'), ('VIUVO', 'Viuvo'), ('DIVORCIADO', 'Divorciado')], default=None, max_length=10, null=True, verbose_name='Estado Cívil')),
                ('birth_date', models.DateField(verbose_name='Data de Nascimento')),
                ('father', models.CharField(blank=True, max_length=150, null=True, verbose_name='Pai')),
                ('mother', models.CharField(blank=True, max_length=150, null=True, verbose_name='Mãe')),
                ('phone', models.CharField(max_length=16, verbose_name='Telefone')),
                ('types', models.CharField(choices=[('Estudante', 'Estudante'), ('Professor', 'Professor'), ('Técnico Administrativo', 'Técnico Administrativo'), ('Terceirizado', 'Terceirizado'), ('Dependente', 'Dependente')], default='Estudante', max_length=25, verbose_name='Tipo')),
                ('email', models.EmailField(blank=True, max_length=254, null=True, verbose_name='E-mail')),
                ('course', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='odontology.Course')),
                ('dependents', models.ManyToManyField(to='odontology.Patient')),
            ],
            options={
                'verbose_name_plural': 'Pacientes',
                'ordering': ['-created_on'],
                'verbose_name': 'Paciente',
            },
        ),
        migrations.CreateModel(
            name='PatientDentalProcedure',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('evaluation', models.BooleanField(default=False)),
                ('consultation', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='odontology.Consultation')),
                ('dentist', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='odontology.Dentist')),
            ],
            options={
                'verbose_name_plural': 'Procedimentos Dental',
                'ordering': ['-created_on'],
                'verbose_name': 'Procedimento Dental',
            },
        ),
        migrations.CreateModel(
            name='PatientTooth',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('patient', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='odontology.Patient')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='ProcedureDental',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('name', models.CharField(max_length=50, verbose_name='Nome')),
                ('description', models.CharField(blank=True, max_length=100, null=True, verbose_name='Descrição')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Tooth',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('name', models.CharField(max_length=50, verbose_name='Nome')),
                ('description', models.CharField(max_length=100, verbose_name='Descrição')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='ToothDivision',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_on', models.DateTimeField(auto_now_add=True, verbose_name='Criado em')),
                ('updated_on', models.DateTimeField(auto_now=True, verbose_name='Autalizado em')),
                ('name', models.CharField(max_length=50, verbose_name='Nome')),
                ('description', models.CharField(max_length=100, verbose_name='Descrição')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='patienttooth',
            name='tooth',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='odontology.Tooth'),
        ),
        migrations.AddField(
            model_name='patientdentalprocedure',
            name='patient_tooth',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='patient_dental_procedure', to='odontology.PatientTooth'),
        ),
        migrations.AddField(
            model_name='patientdentalprocedure',
            name='procedure_dental',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='odontology.ProcedureDental'),
        ),
        migrations.AddField(
            model_name='patientdentalprocedure',
            name='tooth_division',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='odontology.ToothDivision'),
        ),
        migrations.AddField(
            model_name='oralpatientprocedure',
            name='oral_procedure',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='odontology.OralProcedure'),
        ),
        migrations.AddField(
            model_name='examinationsolicitation',
            name='exams',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='odontology.Exams'),
        ),
        migrations.AddField(
            model_name='consultation',
            name='dentist',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='consultation_dentist', to='odontology.Dentist'),
        ),
        migrations.AddField(
            model_name='consultation',
            name='patient',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='consultation_patient', to='odontology.Patient'),
        ),
    ]
