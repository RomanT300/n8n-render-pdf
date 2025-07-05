FROM n8nio/n8n

# Cambiar a root para instalar dependencias
USER root

# Instalar pdf-parse
RUN npm install -g pdf-parse

# Volver al usuario node
USER node
