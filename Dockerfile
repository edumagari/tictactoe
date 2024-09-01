FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libjpeg-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libssl-dev \
    pkg-config \
    libssl-dev \
    unzip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) \
    bcmath \
    ctype \
    fileinfo \
    json \
    mbstring \
    openssl \
    pdo \
    pdo_mysql \
    tokenizer \
    xml \
    curl \
    zip \
    gd \
    intl \
    sockets \
    exif

# Install Redis extension
RUN pecl install redis && docker-php-ext-enable redis

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*