# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-03-23 12:11
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('odontology', '0004_auto_20160322_0944'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='consultation',
            name='observation',
        ),
    ]