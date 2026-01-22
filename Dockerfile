FROM python:3.12-slim

# Install curl for ECS container health checks (CMD-SHELL ... curl -f ...)
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY app/app.py /app/app.py

EXPOSE 8080

CMD ["python", "app.py"]
