from django.shortcuts import render, redirect, render_to_response, get_object_or_404
from django.contrib import messages
from django.template import RequestContext

from .models import Dentist, Consultation, PatientTooth, OralPatientProcedure, ExaminationSolicitation
from .forms import ConsultationEditForm, ExaminationSolicitationForm, PatientDentalProcedureForm, OralPatientProcedureForm

def odontology_required(view_func):
	def _wrapper(request, *args, **kwargs):
		
		# Tras os dados da Views e já executa essa função, e depois logo abaixo ele atualiza o contexto
		r = view_func(request, *args, **kwargs)

		consultation = Consultation.objects.get(pk=kwargs['consultation_id'])
		consultation_form = ConsultationEditForm(instance=consultation)
		form_patient_dental_procedure = PatientDentalProcedureForm(patient=consultation.patient) # empty form
		
		# Odontograma
		odontogram_patient = PatientTooth.objects.filter(patient=consultation.patient).order_by('tooth')
		# Quebra dos blocos dentarios para exibição do template correto
		block1 = odontogram_patient[0:8] # do dente 18 ao 11
		block2 = odontogram_patient[8:16] # do dente 21 ao 28
		block3 = odontogram_patient[16:24] # do dente 48 ao 41
		block4 = odontogram_patient[24:32] # do dente 31 ao 38

		# Dentes Deciduos (INFANTIL)
		block5 = odontogram_patient[32:37] # do dente 18 ao 11
		block6 = odontogram_patient[37:42] # do dente 21 ao 28
		block7 = odontogram_patient[42:47] # do dente 48 ao 41
		block8 = odontogram_patient[47:52] # do dente 31 ao 38

		# Procedimento Bucal
		oral_patient_procedure = OralPatientProcedure.objects.filter(consultation=consultation)
		# Examination Solicitation
		examination_solicitation = ExaminationSolicitation.objects.filter(consultation=consultation)
		form_examination_solicitation = ExaminationSolicitationForm
		form_patient_dental_procedure = PatientDentalProcedureForm(patient=consultation.patient) # empty form
		form_oral_patient_procedure = OralPatientProcedureForm # empty form
		# passa os valores para o context
		context = {
			'consultation_form': consultation_form,
			'form_patient_dental_procedure': form_patient_dental_procedure,
			'form_oral_patient_procedure': form_oral_patient_procedure,
			'oral_patient_procedure': oral_patient_procedure,
			'examination_solicitation': examination_solicitation,
			'form_examination_solicitation': form_examination_solicitation,
			'consultation': consultation,
			'block1': block1,
			'block2': block2,
			'block3': block3,
			'block4': block4,
			'block5': block5,
			'block6': block6,
			'block7': block7,
			'block8': block8
		}
		# Atualiza o contexto
		r.context_data.update(context or {})
		return r.render()
	return _wrapper