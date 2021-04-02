# -*- coding: utf-8 -*-
# Created by Luis Enrique Fuentes Plata

# pull official base image
FROM python:3.7.10-slim-buster

# set work directory
ENV APP_HOME /usr/src/app
WORKDIR $APP_HOME

# set environment variables
# Prevents Python from writing pyc files to disc
# Prevents Python from buffering stdout and stderr
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt
