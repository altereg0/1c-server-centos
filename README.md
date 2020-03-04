# 1c-server

## Что это?

1c-server -- это docker-стек из сервера 1С:Предприятия + СУБД PostgreSQL Pro + MS SQL Server 2017.

## Как это установить?

Клонируйте репозиторий:

    git clone https://github.com/its.bz/1c-server.git .

Если у вас есть более свежие Файлы дистрибутива сервера 1С:Предприятия или вы можете их скачать, то:
  - Получите дистрибутив сервера 1С:Предприятия: `https://users.v8.1c.ru/` -> Скачать обновления -> Технологическая платформа 8.3 -> ВЕРСИЯ -> Cервер 1С:Предприятия (64-bit) для DEB-based Linux-систем -> Скачать дистрибутив
  - Скопируйте deb-файлы из него в каталог `./src/1c/`
  - Пропишите версию в `./src/1c/Dockerfile`

    ENV PLATFORM_VERSION 83
    ENV SERVER_VERSION 8.3.13-1690

Чтобы собрать образ выполните:

    sh ./build.sh

Если хотите использовать готовый образ (внутри сервер 8.3.13.1690), тогда выполните:

    sh ./up.sh

## Особенности

В настоящее время работа сервера 1С:Предприятие под Linux невозможна с MSSQL. Только с Windows-версией сервера.
Подождём, а пока можно использовать MSSQL в контейнере для сервера 1С под Windows.
Если вам это нужно - раскомментируйте сервис в `docker-compose.yml`
Иначе - используем `PostgreSQL`.

## Как остановить/запустить/перезапустить контейнер?

Для управления отдельным контейнером используйте команды с именами контейнеров:

    docker-compose start|stop|restart 1c-server
    docker-compose start|stop|restart 1c-pg
    docker-compose start|stop|restart 1c-ms

Для управления стэком целиком:

    docker-compose start|stop|restart 
    docker-compose start|stop|restart

## Где мои данные?

Данные сервера 1С:Предприятия и СУБД вы можете найти в каталогах: 
    ./volumes/1c-server
    ./volumes/1c-pg
    ./volumes/1c-ms

## Как это удалить?

Удалите стек (все контейнеры, стек и сеть):

    docker-compose down

Удалите образы:

    docker rmi itsbz/1c-server
    docker rmi itsbz/1c-pg
    docker rmi itsbz/1c-ms

:fire: Удалите данные:

    rm -rf ./volumes

## Как с этим работать?

В папке `1c-admin` под windows запустить с правами Администратора единоразово `RegMSC.cmd`, а далее использовать `1CV8_Servers (x86-64) .msc` для администрирования сервера 1С.
На windows-машине придётся прописать в `hosts`:

   "IP-адрес машины с docker"  srv-1c

Далее обращаться по этому имени и к серверу 1С (`1540`), и к PostgreSQL (`5432`), и к MSSQL (`1433`)
