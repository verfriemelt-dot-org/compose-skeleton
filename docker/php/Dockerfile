ARG PHP_VERSION=8.2
FROM php:${PHP_VERSION}-fpm

ENV COMPOSER_NO_INTERACTION=1
ENV COMPOSER_DISCARD_CHANGES=1
ENV DEBIAN_FRONTEND=noninteractive

ARG USER
ARG UID=1000

RUN useradd -U $USER -u $UID
RUN mkdir /home/$USER && chown $USER:$USER /home/$USER

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions xdebug @composer-2

RUN apt-get update && apt-get install default-mysql-client -y
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt-get install symfony-cli -y

COPY . /var/www
WORKDIR /var/www

EXPOSE 9000
USER $USER
CMD php-fpm
