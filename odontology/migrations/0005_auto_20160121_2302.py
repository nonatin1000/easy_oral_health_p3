# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-01-21 23:02
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('odontology', '0004_auto_20160121_2300'),
    ]

    operations = [
        migrations.AlterField(
            model_name='patient',
            name='course',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='odontology.Course'),
        ),
    ]
