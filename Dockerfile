# Usar la imagen base de Python:3.9-alpine
FROM python:3.9-alpine

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Instalar las dependencias necesarias (solo si es necesario para Alpine)
RUN apk update && apk add --no-cache \
    build-base \
    libffi-dev \
    python3-dev

# Copiar el archivo requirements.txt al contenedor
COPY requirements.txt /app/

# Instalar las dependencias desde requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto del código de la aplicación al contenedor
COPY . /app/

# Definir el comando para ejecutar la aplicación
CMD ["python", "app.py"]
