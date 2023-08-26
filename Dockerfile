FROM php:8.2-fpm-bullseye

RUN apt-get update && apt-get install -y \
        libvips-dev \
        libicu-dev \
        zlib1g-dev \
        libpng-dev \
        libjpeg-dev \
        libfreetype-dev \
        libxml2-dev \
        wget \
        librabbitmq-dev \
        libssl-dev \
        libcurl4-gnutls-dev \
        pkg-config \
        poppler-utils \
        ghostscript \
        imagemagick \
        libmagick++-dev \
        ffmpeg \
        libzip-dev \
        libpq-dev \
        gawk \
        bash \
        libldap-dev \
        procps

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql

RUN echo "NPROC: $(nproc)" \
  && docker-php-ext-install -j$(nproc) opcache \
  && docker-php-ext-install -j$(nproc) intl \
  && docker-php-ext-install -j$(nproc) zip \
  && docker-php-ext-install -j$(nproc) pdo \
  && docker-php-ext-install -j$(nproc) pdo_pgsql \
  && docker-php-ext-install -j$(nproc) exif \
  && docker-php-ext-configure gd --with-freetype=/usr/include --with-jpeg=/usr/include \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-ext-install -j$(nproc) xml \
  && docker-php-ext-install -j$(nproc) curl \
  && docker-php-ext-install -j$(nproc) bcmath \
  && docker-php-ext-configure ldap \
  && docker-php-ext-install -j$(nproc) ldap \
  && docker-php-ext-install -j$(nproc) pcntlcker-php-ext-install pdo_pgsql \