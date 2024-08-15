#!/bin/sh

# Navigate to the application directory
cd /var/www/html

# Install PHP dependencies
if [ -f composer.json ]; then
    echo "Installing PHP dependencies..."
    composer install
fi

# Install Node.js dependencies
if [ -f package.json ]; then
    echo "Installing Node.js dependencies..."
    npm install
fi

# Start Vite in the background
# if [ -f package.json ] && grep -q "dev" package.json; then
#     echo "Starting Vite..."
#     npm run dev &
# fi

# Start PHP-FPM
exec php-fpm
