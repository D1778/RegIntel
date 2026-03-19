# Official Playwright Python image — Chromium is pre-installed, no extra install needed.
FROM mcr.microsoft.com/playwright/python:v1.53.0-noble

WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project source
COPY . .

# Collect static files (needs dummy secret key; real one injected at runtime via env)
RUN DJANGO_SECRET_KEY=build-placeholder \
    DB_HOST=localhost DB_USER=x DB_PASS=x DB_NAME=x \
    python manage.py collectstatic --noinput

EXPOSE 10000

CMD gunicorn config.wsgi:application \
    --bind 0.0.0.0:${PORT:-10000} \
    --workers 2 \
    --threads 4 \
    --timeout 120
