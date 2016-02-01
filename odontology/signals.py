# -*- coding: utf-8 -*-

from django.db.models.signals import post_save, post_delete
from django.dispatch import receiver
from .models import Patient, PatientTooth, Tooth, ToothStatus

""" 
	registering the patient's teeth after saving the patient
"""
@receiver(post_save, sender=Patient)
def create_patient_tooth(sender, instance, **kwargs):
    teeth = Tooth.objects.all() # find all teeth
    tooth_status = ToothStatus.objects.get(pk=1)
    patient_tooth = PatientTooth.objects.filter(patient=instance)
    patient = instance
    if not patient_tooth:
    	for tooth in teeth:
    		patient_tooth = PatientTooth(tooth=tooth, patient=patient, tooth_status=tooth_status)
    		patient_tooth.save()

"""
 	when deleting a patient also excludes the patient's teeth
"""
@receiver(post_delete, sender=Patient)
def delete_patient_tooth(sender, instance, **kwargs):
    patients_tooth = PatientTooth.objects.filter(patient=instance)
    if patients_tooth:
    	for patient_tooth in patients_tooth:
    		patient_tooth.delete()
