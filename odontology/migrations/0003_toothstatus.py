# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-01-08 20:44
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('odontology', '0002_auto_20160108_1744'),
    ]

    operations = [
        migrations.CreateModel(
            name='ToothStatus',
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
    ]
