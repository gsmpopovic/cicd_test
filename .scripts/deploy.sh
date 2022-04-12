echo "Starting deployment..."

# enter maintenance mode or return true
(php artisan down) || true 

# pull latest version of app
git pull origin production

#install composer dependencies
composer install --no-dev --no-interaction --prefer-dist --optimize-autoload

# clear the old cache
php artisan clear-compiled

#compile npm assets
npm run prod

# run database migrations 
php artisan migrate --force

# Exit maintenance mode
echo "Deployment finished..."