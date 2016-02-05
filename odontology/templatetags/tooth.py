from django import template

register = template.Library()

@register.inclusion_tag('tooth.html')
def render_tooth(tooth ):
	div={} # Divisão dos Dentes
	for p in tooth.patient_tooth.all():
		div[p.tooth_division.pk]=p.procedure_dental.pk
	return {'tooth': tooth,'div':div}