#!/bin/sh
python manage.py collectstatic --noinput
gunicorn django_main.wsgi:application --bind 0.0.0.0:8000