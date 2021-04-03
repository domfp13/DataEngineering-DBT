# -*- coding: utf-8 -*-
# Created by Luis Enrique Fuentes Plata

# 1.- Pull official base image
FROM python:3.7.10-slim-buster

# 2.- Set environment variables
# 2.1.- Working path variable
# 2.2.- Prevents Python from writing pyc files to disc
# 2.3.- Prevents Python from buffering stdout and stderr
ENV APP_HOME /usr/src/app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 3.- Installing OS packages
RUN apt-get update && \
    apt-get install -y locales && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    echo LANG=en_US.utf8 > /etc/default/locale && \
    apt-get install -yy unzip wget git curl && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

# 4.- install python deps
RUN pip install --upgrade pip

# 5.- Copying python requirements and installing them
COPY ./requirements.txt $APP_HOME/requirements.txt
WORKDIR $APP_HOME
RUN pip install -r requirements.txt
