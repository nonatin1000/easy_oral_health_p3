from django import template

register = template.Library()

# templatetag usado para passar a consulta como paramentro no template report_service para calculara faixa etária
@register.filter('age')
def get_age(patient, consultation):
	return patient.age(consultation)

# Templatetag usando para pegar os dentes de cada paciente e gerar o odontograma
@register.inclusion_tag('tooth.html')
def render_tooth(tooth ):
	div={} # Divisão dos Dentes
	for p in tooth.patient_dental_procedure.all():
		div[p.tooth_division.pk]=p.procedure_dental.pk
	return {'tooth': tooth,'div':div}