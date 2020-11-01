#FROM python:3.6-alpine as builder
# copy numpy from builder
#COPY --from=builder /usr/local /usr/local
#maybe later

# pull official base image
FROM python:3.9-slim

# set work directory
WORKDIR /usr/src/app

# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir poetry
COPY ./pyproject.toml /usr/src/app/pyproject.toml
COPY ./poetry.lock /usr/src/app/poetry.lock
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev
RUN pip uninstall -y poetry
RUN pip uninstall -y pip

COPY ./gunicorn.sh /usr/src/app/gunicorn.sh
RUN chmod +x gunicorn.sh && sed -i 's/\r//' gunicorn.sh

COPY ./rundevserver.sh /usr/src/app/rundevserver.sh
RUN chmod +x rundevserver.sh && sed -i 's/\r//' rundevserver.sh

#RUN useradd --create-home appuser
#USER appuser

# copy project
COPY src_django /usr/src/app/
