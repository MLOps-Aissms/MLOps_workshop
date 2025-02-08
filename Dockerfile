FROM python:3.12.2-slim
LABEL maintainer='MLOps'
LABEL version="1.0" 

# disable cookie storage
ENV PYTHONBUFFFERED 1 

WORKDIR /app

COPY ./requirements.txt /requirements.txt

COPY ./models/models.joblib /models/models.joblib

COPY ./webpage /app/webpage

EXPOSE 8000

RUN python3 -m venv /myenv && \
    /myenv/bin/pip install --upgrade pip && \
    /myenv/bin/pip install -r /requirements.txt \
    rm -rf /root/.cache &&  \
    adduser --disable-password --no-create-home appuser

ENV PATH="/myenv/bin:$PATH"

USER appuser







