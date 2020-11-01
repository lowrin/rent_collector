#!/bin/sh
python manage.py collectstatic --noinput
python manage.py runserver --nostatic 0.0.0.0:8000
