FROM python:3.8.5

ENV DIRPATH=/code
WORKDIR $DIRPATH
COPY . .

RUN pip install -r requirements.txt
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000