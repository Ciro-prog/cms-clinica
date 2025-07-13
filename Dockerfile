# Dockerfile para Strapi CMS
FROM node:18-alpine

# Configurar directorio de trabajo
WORKDIR /opt/app

# Instalar dependencias del sistema
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias de Node.js (usando npm install para resolver conflictos)
RUN npm install --omit=dev

# Copiar código fuente
COPY . .

# Variables de entorno
ENV NODE_ENV=production

# Construir la aplicación
RUN npm run build

# Exponer puerto (Strapi usa 1337 por defecto)
EXPOSE 1337

# Crear usuario no root
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 strapi

# Cambiar propietario de archivos
USER strapi

# Comando de inicio
CMD ["npm", "start"]