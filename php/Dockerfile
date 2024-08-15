FROM php:8.2-fpm

WORKDIR /var/www/html

# Install dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    libzip-dev \
    gnupg \
    && docker-php-ext-install mysqli pdo pdo_mysql zip \
    && rm -rf /var/lib/apt/lists/* 

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get update && apt-get install -y nodejs

ENV CHOKIDAR_USEPOLLING=true
# Copy Composer from the Composer image
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose port 9000 for PHP-FPM
EXPOSE 9000
EXPOSE 5173

# Set the entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Default command to start PHP-FPM
CMD ["php-fpm"]
