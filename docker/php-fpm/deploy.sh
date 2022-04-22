#!/bin/sh

composer install --no-interaction --prefer-dist --optimize-autoloader

npm i
npm run dev

chown -R www-data:www-data storage bootstrap/cache

php artisan migrate
