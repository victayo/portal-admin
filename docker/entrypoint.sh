#!/bin/bash

composer install --no-progress --no-interaction

npm install
npm run dev

if [ ! -f ".env" ]; then
    echo "Creating env file for env $APP_ENV"
    cp .env.example .env
else
    echo "env file exists."
fi

php artisan key:generate
php artisan config:clear
php artisan view:clear
php artisan cache:clear


php-fpm -D
nginx -g "daemon off;"
