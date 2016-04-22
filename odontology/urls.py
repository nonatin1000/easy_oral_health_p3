"""easy_oral_health URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Import the include() function: from django.conf.urls import url, include
    3. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import url
from django.contrib.auth.views import logout_then_login,login
from . import views

urlpatterns = [
    # Autocomplete
    url(r'^patient-autocomplete/$', views.PatientAutocomplete.as_view(), name='patient-autocomplete'), 
    # Login
    url(r'^logout/$', logout_then_login, { 'login_url': '/odontology/login/' }, name='logout'), 
    url(r'^login/$', login, { 'template_name': 'login.html' }, name='login'), 
    # Dentist
    url(r'^dentist_index/$', views.dentist_index , name='dentist_index'),
    url(r'^dentist_register/$', views.dentist_register , name='dentist_register'),
    url(r'^dentist_edit/(?P<user_id>\d+)/$', views.dentist_register , name='dentist_edit'),
    url(r'^dentist_show/(?P<user_id>\d+)/$', views.dentist_show , name='dentist_show'),
    url(r'^dentist_delete/(?P<user_id>\d+)/$', views.dentist_delete , name='dentist_delete'),
    # Course
    url(r'^course_index/$', views.course_index , name='course_index'),
    url(r'^course_register/$', views.course_register , name='course_register'),
    url(r'^course_edit/(?P<course_id>\d+)/$', views.course_register , name='course_edit'),
    url(r'^course_show/(?P<course_id>\d+)/$', views.course_show , name='course_show'),
    url(r'^course_delete/(?P<course_id>\d+)/$', views.course_delete , name='course_delete'),
    # Tooth
    url(r'^tooth_index/$', views.tooth_index , name='tooth_index'),
    url(r'^tooth_register/$', views.tooth_register , name='tooth_register'),
    url(r'^tooth_edit/(?P<tooth_id>\d+)/$', views.tooth_register , name='tooth_edit'),
    url(r'^tooth_show/(?P<tooth_id>\d+)/$', views.tooth_show , name='tooth_show'),
    url(r'^toorh_delete/(?P<tooth_id>\d+)/$', views.tooth_delete , name='tooth_delete'),
    # ToothDivision
    url(r'^tooth_division_index/$', views.tooth_division_index , name='tooth_division_index'),
    url(r'^tooth_division_register/$', views.tooth_division_register , name='tooth_division_register'),
    url(r'^tooth_division_edit/(?P<tooth_division_id>\d+)/$', views.tooth_division_register , name='tooth_division_edit'),
    url(r'^tooth_division_show/(?P<tooth_division_id>\d+)/$', views.tooth_division_show , name='tooth_division_show'),
    url(r'^toorh_division_delete/(?P<tooth_division_id>\d+)/$', views.tooth_division_delete , name='tooth_division_delete'),
    # Patient
    url(r'^patient_index/$', views.patient_index , name='patient_index'),
    url(r'^patient_register/$', views.patient_register , name='patient_register'),
    url(r'^patient_edit/(?P<patient_id>\d+)/$', views.patient_register , name='patient_edit'),
    url(r'^patient_show/(?P<patient_id>\d+)/$', views.patient_show , name='patient_show'),
    url(r'^patient_delete/(?P<patient_id>\d+)/$', views.patient_delete , name='patient_delete'),
    # Dependent
    url(r'^dependent_register/(?P<patient_id>\d+)/$', views.dependent_register , name='dependent_register'),
    # Odontogram
    url(r'^odontogram/(?P<patient_id>\d+)/$', views.odontogram , name='odontogram'),
    # Oral Patient Procedure
    url(r'^oral_patient_procedure/(?P<patient_id>\d+)/$', views.oral_patient_procedure , name='oral_patient_procedure'),
    # PatientDentalProcedure
    url(r'^patient_dental_procedure_register/(?P<consultation_id>\d+)/$', views.patient_dental_procedure_register , name='patient_dental_procedure_register'),
    url(r'^patient_dental_procedure_delete/(?P<patient_dental_procedure_id>\d+)/$', views.patient_dental_procedure_delete , name='patient_dental_procedure_delete'),
    # Procedure Dental
    url(r'^procedure_dental_index/$', views.procedure_dental_index , name='procedure_dental_index'),
    url(r'^procedure_dental_register/$', views.procedure_dental_register , name='procedure_dental_register'),
    url(r'^procedure_dental_edit/(?P<procedure_dental_id>\d+)/$', views.procedure_dental_register , name='procedure_dental_edit'),
    url(r'^procedure_dental_show/(?P<procedure_dental_id>\d+)/$', views.procedure_dental_show , name='procedure_dental_show'),
    url(r'^procedure_dental_delete/(?P<procedure_dental_id>\d+)/$', views.procedure_dental_delete , name='procedure_dental_delete'),
    # OralProcedure
    url(r'^oral_procedure_index/$', views.oral_procedure_index , name='oral_procedure_index'),
    url(r'^oral_procedure_register/$', views.oral_procedure_register , name='oral_procedure_register'),
    url(r'^oral_procedure_edit/(?P<oral_procedure_id>\d+)/$', views.oral_procedure_register , name='oral_procedure_edit'),
    url(r'^oral_procedure_show/(?P<oral_procedure_id>\d+)/$', views.oral_procedure_show , name='oral_procedure_show'),
    url(r'^oral_procedure_delete/(?P<oral_procedure_id>\d+)/$', views.oral_procedure_delete , name='oral_procedure_delete'),
    # OralPatientProcedure
    url(r'^oral_patient_procedure_register/(?P<consultation_id>\d+)/$', views.oral_patient_procedure_register , name='oral_patient_procedure_register'),
    url(r'^oral_patient_procedure_edit/(?P<oral_patient_procedure_id>\d+)/$', views.oral_patient_procedure_register , name='oral_patient_procedure_edit'),
    url(r'^oral_patient_procedure_delete/(?P<oral_patient_procedure_id>\d+)/$', views.oral_patient_procedure_delete , name='oral_patient_procedure_delete'),
    # Consultation
    url(r'^consultation_create/$', views.consultation_create , name='consultation_create'),
    url(r'^consultation_patient/(?P<consultation_id>\d+)/$', views.consult_patient , name='consultation_edit'),
    url(r'^consultation_index/$', views.consultation_index , name='consultation_index'),
    url(r'^consultation_show/(?P<consultation_id>\d+)/$', views.consultation_show , name='consultation_show'),
    url(r'^consultation_delete/(?P<consultation_id>\d+)/$', views.consultation_delete , name='consultation_delete'),
    url(r'^report_service/$', views.report_service , name='report_service'),
    url(r'^report_annual_quantitative/$', views.report_annual_quantitative , name='report_annual_quantitative'),
    #url(r'^report_category/$', views.report_category , name='report_category'),
    #url(r'^report_genre/$', views.report_genre , name='report_genre'),
    #url(r'^report_age_group/$', views.report_age_group , name='report_age_group'),
    #url(r'^report_procedure/$', views.report_procedure , name='report_procedure'),
    # Exams
    url(r'^exams_index/$', views.exams_index , name='exams_index'),
    url(r'^exams_register/$', views.exams_register , name='exams_register'),
    url(r'^exams_edit/(?P<exams_id>\d+)/$', views.exams_register , name='exams_edit'),
    url(r'^exams_show/(?P<exams_id>\d+)/$', views.exams_show , name='exams_show'),
    url(r'^exams_delete/(?P<exams_id>\d+)/$', views.exams_delete , name='exams_delete'),
    # ExaminationSolicitation
    url(r'^examination_solicitation_register/(?P<consultation_id>\d+)/$', views.examination_solicitation_register , name='examination_solicitation_register'),
    url(r'^examination_solicitation_edit/(?P<examination_solicitation_id>\d+)/$', views.examination_solicitation_register , name='examination_solicitation_edit'),
    url(r'^examination_solicitation_delete/(?P<examination_solicitation_id>\d+)/$', views.examination_solicitation_delete , name='examination_solicitation_delete'),
    
]
