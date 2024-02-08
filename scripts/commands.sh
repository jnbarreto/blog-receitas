#!/bin/sh

set -e

while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
    echo "🟡 Waiting for Postgres Database Startup($POSTGRES_HOST $POSTGRES_PORT) ... "
    sleep 2
done

echo "✅ Postgres Database Started Successfully ($POSTGRES_HOST $POSTGRES_PORT)"

python manage.py collectstatic --noinput
echo "✅ collectstatic completed Successfully"
python manage.py makemigrations --noinput
echo "✅ makemigrations completed Successfully"
python manage.py migrate --noinput
echo "✅ migrate completed Successfully"
python manage.py runserver 0.0.0.0:8000
