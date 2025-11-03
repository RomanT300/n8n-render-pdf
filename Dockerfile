# Usar la última versión de n8n
FROM n8nio/n8n:latest

# Forzar rebuild - Última actualización: 2025-10-26
ARG CACHE_BUST=2025-11-03

# Cambiar a root para instalar dependencias
USER root

# Instalar pdf-parse
RUN npm install -g pdf-parse

# Volver al usuario node
USER node
