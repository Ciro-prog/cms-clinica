# Despliegue CMS Clínicas con Docker

## 1. Construir la imagen
```
docker-compose build
```

## 2. Levantar los servicios
```
docker-compose up -d
```

## 3. Acceso
- Panel de administración: http://TU_SERVIDOR:1337/admin

## 4. Variables de entorno
Edita el archivo `.env` para tus necesidades.

## 5. Persistencia
- Los archivos subidos y la base de datos SQLite se guardan en las carpetas `uploads/` y `data/` respectivamente.

## 6. Parar los servicios
```
docker-compose down
``` 