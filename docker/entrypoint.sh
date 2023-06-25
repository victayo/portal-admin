#!/bin/bash

composer install --no-progress --no-interaction

npm install

if [ ${APP_ENV} = "production" ]; then
    echo "Production environment"
    npm run prod
else
    echo "Local Environment"
    npm run dev
fi

php artisan config:clear
php artisan view:clear
php artisan cache:clear


php-fpm -D
nginx -g "daemon off;"
