# YaMDb

![](https://github.com/konerld/yamdb_final/workflows/yamdb-final-workflow/badge.svg)

## Описание
REST API-сервис YaMDb - базы отзывов о фильмах, книгах и музыке.

Сервис YaMDb собирает отзывы пользователей на произведения.


## Требования

* Python 3.7
* Docker 20.10.0 или выше
* Docker-compose 1.27.4 или выше


## Быстрый старт (Docker)

* Клонировать данный репозиторий

* Создать файл .env и заполнить необходимые переменные (по шаблону ниже):

        DB_ENGINE=django.db.backends.postgresql # указываем, что работаем с postgresql
        DB_NAME=yamdb # имя БД к которой будет обращаится django
        POSTGRES_USER=yamdb_user # пользователь postgres с полными правами к БД
        POSTGRES_PASSWORD=xxxyyyzzz333222111 # пароль пользователя БД
        DB_HOST=db # имя контейнера postgres из docker-compose.yaml
        DB_PORT=5432 # порт СУБД postgresql


* Выполнить команду:

        docker-compose up

* Создать базу данных для проекта (необходимо при первом запуске):
    
        pg_id=`docker container ls |grep postgres |awk '{print $1}'`
        docker exec -t $pg_id psql -U yamdb_user -c "CREATE DATABASE yamdb;"
        docker exec -t $pg_id psql -U yamdb_user -c "GRANT ALL PRIVILEGES ON DATABASE yamdb TO yamdb_user;"


* Подключиться к контейнеру yamdb:

        docker exec -it <CONTAINER_ID> /bin/bash, 
    
    *<CONTAINER_ID> - id контейнера yamdb*
    
    *id контейнера можно посмотреть командой "docker ps"*
    
* В контейнере yamdb выполняем следующие команды:
    * Создать супервользователя:
      
            python manage.py createsuperuser
        
    * Выполнить миграции:
    
            python manage.py migrate
    
* Далее доступны следнующие ресурсы:
    * Основной URL сервиса: http://127.0.0.1:8000/
    * Панель администратора: http://127.0.0.1:8000/admin/login/
    * Описание доступных API севиса: http://127.0.0.1:8000//redoc

# Благодарности

Огромное спасибо моему ревьюеру Ане, за то что не давала мне опускать руки и грамотно направляла на улучшение моего говнокода.
