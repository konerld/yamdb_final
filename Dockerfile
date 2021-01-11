FROM python:3.8.5

ENV DIRPATH=/code
WORKDIR $DIRPATH
COPY . .

RUN pip install -r requirements.txt

CMD python manage.py collectstatic --noinput && \
    python manage.py makemigrations && \
    python manage.py migrate
