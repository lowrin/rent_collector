FROM python:3.7-slim-stretch

# set work directory
WORKDIR /usr/src/app

# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#Install Cron
RUN apt-get update && apt-get install -y cron dos2unix && rm -rf /var/lib/apt/lists/*

# install dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir pipenv
COPY ./Pipfile /usr/src/app/Pipfile
COPY ./Pipfile.lock /usr/src/app/Pipfile.lock
RUN pipenv install --system --ignore-pipfile --deploy
RUN pip uninstall -y pipenv
RUN pip uninstall -y pip

ADD ./cron/crontab /etc/cron.d/hello-cron
ADD ./cron/entry.sh /etc/cron.d/entry.sh

RUN chmod 0644 /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/entry.sh

RUN chmod +x /etc/cron.d/entry.sh

# copy project
COPY src_django /usr/src/app/

# the env vars to use in the cron job
COPY ./env.prod /usr/src/app/.env

RUN dos2unix /etc/cron.d/hello-cron && dos2unix /etc/cron.d/entry.sh && dos2unix .env

CMD ["cron", "-f"]
