from django import template

register = template.Library()

# templatetag usado para passar a consulta como paramentro no template report_service para calculara faixa etária
@register.filter('age')
def get_age(patient, consultation):
	return patient.age(consultation)

# Templatetag usando para pegar os dentes de cada paciente e gerar o odontograma
@register.inclusion_tag('tooth_18_to_11.html')
def render_tooth_18_to_11(tooth ):
	div={} # Divisão dos Dentes
	for p in tooth.patient_dental_procedure.all().order_by('created_on'):
		div[p.tooth_division.pk]=p.procedure_dental.pk
	return {'tooth': tooth,'div':div}

@register.inclusion_tag('tooth_21_to_28.html')
def render_tooth_21_to_28(tooth ):
	div={} # Divisão dos Dentes
	for p in tooth.patient_dental_procedure.all().order_by('created_on'):
		div[p.tooth_division.pk]=p.procedure_dental.pk
	return {'tooth': tooth,'div':div}

@register.inclusion_tag('tooth_48_to_41.html')
def render_tooth_48_to_41(tooth ):
	div={} # Divisão dos Dentes
	for p in tooth.patient_dental_procedure.all().order_by('created_on'):
		div[p.tooth_division.pk]=p.procedure_dental.pk
	return {'tooth': tooth,'div':div}

@register.inclusion_tag('tooth_31_to_38.html')
def render_tooth_31_to_38(tooth ):
	div={} # Divisão dos Dentes
	for p in tooth.patient_dental_procedure.all().order_by('created_on'):
		div[p.tooth_division.pk]=p.procedure_dental.pk
	return {'tooth': tooth,'div':div}