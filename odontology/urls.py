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
    url(r'dentist_index/$', 'odontology.views.dentist_index', name='dentist_index'),
    url(r'dentist_register/$', 'odontology.views.dentist_register', name='dentist_register'),
    url(r'dentist_edit/(?P<user_id>\d+)/$', 'odontology.views.dentist_register', name='dentist_edit'),
    url(r'dentist_show/(?P<user_id>\d+)/$', 'odontology.views.dentist_show', name='dentist_show'),
    url(r'dentist_delete/(?P<user_id>\d+)/$', 'odontology.views.dentist_delete', name='dentist_delete'),
    url(r'course_index/$', 'odontology.views.course_index', name='course_index'),
    url(r'course_register/$', 'odontology.views.course_register', name='course_register'),
    url(r'course_edit/(?P<course_id>\d+)/$', 'odontology.views.course_register', name='course_edit'),
    url(r'course_show/(?P<course_id>\d+)/$', 'odontology.views.course_show', name='course_show'),
    url(r'course_delete/(?P<course_id>\d+)/$', 'odontology.views.course_delete', name='course_delete'),
    url(r'tooth_status_index/$', 'odontology.views.tooth_status_index', name='tooth_status_index'),
    url(r'tooth_status_register/$', 'odontology.views.tooth_status_register', name='tooth_status_register'),
    url(r'tooth_status_edit/(?P<tooth_status_id>\d+)/$', 'odontology.views.tooth_status_register', name='tooth_status_edit'),
    url(r'tooth_status_show/(?P<tooth_status_id>\d+)/$', 'odontology.views.tooth_status_show', name='tooth_status_show'),
    url(r'tooth_status_delete/(?P<tooth_status_id>\d+)/$', 'odontology.views.tooth_status_delete', name='tooth_status_delete'),
]
