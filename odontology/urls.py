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
from django.contrib import admin
from . import views

urlpatterns = [
    # Login
    url(r'^logout/$', 'django.contrib.auth.views.logout_then_login', { 'login_url': '/odontology/login/' }, name='logout'), 
    url(r'^login/$', 'django.contrib.auth.views.login', { 'template_name': 'login.html' }, name='login'), 
    
    # Dentist
    url(r'^dentist_index/$', 'odontology.views.dentist_index', name='dentist_index'),
    url(r'^dentist_register/$', 'odontology.views.dentist_register', name='dentist_register'),
    url(r'^dentist_edit/(?P<user_id>\d+)/$', 'odontology.views.dentist_register', name='dentist_edit'),
    url(r'^dentist_show/(?P<user_id>\d+)/$', 'odontology.views.dentist_show', name='dentist_show'),
    url(r'^dentist_delete/(?P<user_id>\d+)/$', 'odontology.views.dentist_delete', name='dentist_delete'),
    # Course
    url(r'^course_index/$', 'odontology.views.course_index', name='course_index'),
    url(r'^course_register/$', 'odontology.views.course_register', name='course_register'),
    url(r'^course_edit/(?P<course_id>\d+)/$', 'odontology.views.course_register', name='course_edit'),
    url(r'^course_show/(?P<course_id>\d+)/$', 'odontology.views.course_show', name='course_show'),
    url(r'^course_delete/(?P<course_id>\d+)/$', 'odontology.views.course_delete', name='course_delete'),
    # ToothStatus
    url(r'^tooth_status_index/$', 'odontology.views.tooth_status_index', name='tooth_status_index'),
    url(r'^tooth_status_register/$', 'odontology.views.tooth_status_register', name='tooth_status_register'),
    url(r'^tooth_status_edit/(?P<tooth_status_id>\d+)/$', 'odontology.views.tooth_status_register', name='tooth_status_edit'),
    url(r'^tooth_status_show/(?P<tooth_status_id>\d+)/$', 'odontology.views.tooth_status_show', name='tooth_status_show'),
    url(r'^tooth_status_delete/(?P<tooth_status_id>\d+)/$', 'odontology.views.tooth_status_delete', name='tooth_status_delete'),
    # Tooth
    url(r'^tooth_index/$', 'odontology.views.tooth_index', name='tooth_index'),
    url(r'^tooth_register/$', 'odontology.views.tooth_register', name='tooth_register'),
    url(r'^tooth_edit/(?P<tooth_id>\d+)/$', 'odontology.views.tooth_register', name='tooth_edit'),
    url(r'^tooth_show/(?P<tooth_id>\d+)/$', 'odontology.views.tooth_show', name='tooth_show'),
    url(r'^toorh_delete(?P<tooth_id>\d+)/$', 'odontology.views.tooth_delete', name='tooth_delete'),
    # ToothDivision
    url(r'^tooth_division_index/$', 'odontology.views.tooth_division_index', name='tooth_division_index'),
    url(r'^tooth_division_register/$', 'odontology.views.tooth_division_register', name='tooth_division_register'),
    url(r'^tooth_division_edit/(?P<tooth_division_id>\d+)/$', 'odontology.views.tooth_division_register', name='tooth_division_edit'),
    url(r'^tooth_division_show/(?P<tooth_division_id>\d+)/$', 'odontology.views.tooth_division_show', name='tooth_division_show'),
    url(r'^toorh_division_delete(?P<tooth_division_id>\d+)/$', 'odontology.views.tooth_division_delete', name='tooth_division_delete'),
    # ProcedureStatus
    url(r'^procedure_status_index/$', 'odontology.views.procedure_status_index', name='procedure_status_index'),
    url(r'^procedure_status_register/$', 'odontology.views.procedure_status_register', name='procedure_status_register'),
    url(r'^procedure_status_edit/(?P<procedure_status_id>\d+)/$', 'odontology.views.procedure_status_register', name='procedure_status_edit'),
    url(r'^procedure_status_show/(?P<procedure_status_id>\d+)/$', 'odontology.views.procedure_status_show', name='procedure_status_show'),
    url(r'^procedure_status_delete(?P<procedure_status_id>\d+)/$', 'odontology.views.procedure_status_delete', name='procedure_status_delete'),
    # Patient
    url(r'^patient_index/$', 'odontology.views.patient_index', name='patient_index'),
    url(r'^patient_register/$', 'odontology.views.patient_register', name='patient_register'),
    url(r'^patient_edit/(?P<patient_id>\d+)/$', 'odontology.views.patient_register', name='patient_edit'),
    url(r'^patient_show/(?P<patient_id>\d+)/$', 'odontology.views.patient_show', name='patient_show'),
    url(r'^patient_delete(?P<patient_id>\d+)/$', 'odontology.views.patient_delete', name='patient_delete'),
    # Dependent
    url(r'^dependent_register/(?P<patient_id>\d+)/$', 'odontology.views.dependent_register', name='dependent_register'),
    # Odontogram
    url(r'^odontogram/(?P<patient_id>\d+)/$', 'odontology.views.odontogram', name='odontogram'),
    # ProcedureDental
    url(r'^patient_dental_procedure_index/$', 'odontology.views.patient_dental_procedure_index', name='patient_dental_procedure_index'),
    url(r'^patient_dental_procedure_register/$', 'odontology.views.patient_dental_procedure_register', name='patient_dental_procedure_register'),
    url(r'^patient_dental_procedure_edit/(?P<patient_dental_procedure_id>\d+)/$', 'odontology.views.patient_dental_procedure_register', name='patient_dental_procedure_edit'),
    url(r'^patient_dental_procedure_show/(?P<patient_dental_procedure_id>\d+)/$', 'odontology.views.patient_dental_procedure_show', name='patient_dental_procedure_show'),
    url(r'^patient_dental_procedure_delete(?P<patient_dental_procedure_id>\d+)/$', 'odontology.views.patient_dental_procedure_delete', name='patient_dental_procedure_delete'),
    # PatientDentalProcedure
    url(r'^procedure_dental_index/$', 'odontology.views.procedure_dental_index', name='procedure_dental_index'),
    url(r'^procedure_dental_register/$', 'odontology.views.procedure_dental_register', name='procedure_dental_register'),
    url(r'^procedure_dental_edit/(?P<procedure_dental_id>\d+)/$', 'odontology.views.procedure_dental_register', name='procedure_dental_edit'),
    url(r'^procedure_dental_show/(?P<procedure_dental_id>\d+)/$', 'odontology.views.procedure_dental_show', name='procedure_dental_show'),
    url(r'^procedure_dental_delete(?P<procedure_dental_id>\d+)/$', 'odontology.views.procedure_dental_delete', name='procedure_dental_delete'),
    # OralProcedure
    url(r'^oral_procedure_index/$', 'odontology.views.oral_procedure_index', name='oral_procedure_index'),
    url(r'^oral_procedure_register/$', 'odontology.views.oral_procedure_register', name='oral_procedure_register'),
    url(r'^oral_procedure_edit/(?P<oral_procedure_id>\d+)/$', 'odontology.views.oral_procedure_register', name='oral_procedure_edit'),
    url(r'^oral_procedure_show/(?P<oral_procedure_id>\d+)/$', 'odontology.views.oral_procedure_show', name='oral_procedure_show'),
    url(r'^oral_procedure_delete(?P<oral_procedure_id>\d+)/$', 'odontology.views.oral_procedure_delete', name='oral_procedure_delete'),
    # OralPatientProcedure
    url(r'^oral_patient_procedure_index/$', 'odontology.views.oral_patient_procedure_index', name='oral_patient_procedure_index'),
    url(r'^oral_patient_procedure_register/$', 'odontology.views.oral_patient_procedure_register', name='oral_patient_procedure_register'),
    url(r'^oral_patient_procedure_edit/(?P<oral_patient_procedure_id>\d+)/$', 'odontology.views.oral_patient_procedure_register', name='oral_patient_procedure_edit'),
    url(r'^oral_patient_procedure_show/(?P<oral_patient_procedure_id>\d+)/$', 'odontology.views.oral_patient_procedure_show', name='oral_patient_procedure_show'),
    url(r'^oral_patient_procedure_delete(?P<oral_patient_procedure_id>\d+)/$', 'odontology.views.oral_patient_procedure_delete', name='oral_patient_procedure_delete'),
    
]
