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
    url(r'^$', 'odontology.views.dentist_index', name='dentist_index'),
    url(r'dentist_add/$', 'odontology.views.dentist_add', name='dentist_add'),
    url(r'dentist_edit/(?P<dentist_id>\d+)/$', 'odontology.views.dentist_edit', name='dentist_edit'),
    url(r'dentist_show/(?P<dentist_id>\d+)/$', 'odontology.views.dentist_show', name='dentist_show'),
    url(r'dentist_delete/(?P<dentist_id>\d+)/$', 'odontology.views.dentist_delete', name='dentist_delete'),
]
