# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-01-12 21:01
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('odontology', '0003_auto_20160112_2058'),
    ]

    operations = [
        migrations.AlterField(
            model_name='address',
            name='content_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.ContentType'),
        ),
    ]
