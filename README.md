# n8n PDF Service on Render

Instancia de n8n con soporte para procesamiento de PDF, deployada automáticamente en Render.com.

## 🚀 Características

- **n8n latest version**: Siempre actualizado a la última versión estable
- **PDF Processing**: Incluye `pdf-parse` preinstalado globalmente
- **Auto-Deploy**: Deployment automático en cada push a `main`
- **Auto-Update**: Actualización semanal automática vía GitHub Actions

## 🔄 Sistema de Auto-Actualización

Este repositorio incluye un workflow de GitHub Actions que:

- **Frecuencia**: Cada lunes a las 00:00 UTC
- **Proceso**:
  1. Actualiza `CACHE_BUST` en el Dockerfile con la fecha actual
  2. Hace commit y push automático
  3. Trigger deployment en Render automáticamente
  4. Render rebuilds con la última versión de n8n

### Actualización Manual

Para forzar una actualización inmediata:

1. Ve a: https://github.com/RomanT300/n8n-render-pdf/actions
2. Selecciona el workflow "Auto Update n8n"
3. Click en "Run workflow"

## 📦 Deployment en Render

**URL de producción**: https://n8n-pdf.onrender.com/

**Credenciales por defecto**:
- Usuario: `admin`
- Password: `admin123`

⚠️ **Cambiar en producción** actualizando las variables de entorno en Render Dashboard.

## 🛠️ Configuración

### Variables de Entorno (render.yaml)

```yaml
N8N_BASIC_AUTH_ACTIVE: "true"
N8N_BASIC_AUTH_USER: "admin"
N8N_BASIC_AUTH_PASSWORD: "admin123"
N8N_PORT: "10000"
N8N_HOST: "n8n-pdf.onrender.com"
WEBHOOK_URL: "https://n8n-pdf.onrender.com/"
N8N_PROTOCOL: "https"
```

### Modificar Variables de Entorno

1. Ve a Render Dashboard → tu servicio `n8n-pdf`
2. Pestaña "Environment"
3. Modifica las variables necesarias
4. Click "Save Changes" (triggerea auto-deploy)

## 🔧 Desarrollo Local

```bash
# Clonar repositorio
git clone https://github.com/RomanT300/n8n-render-pdf.git
cd n8n-render-pdf

# Build Docker image
docker build -t n8n-pdf .

# Run localmente
docker run -p 5678:5678 n8n-pdf
```

Accede a: http://localhost:5678

## 📝 Estructura del Proyecto

```
.
├── .github/
│   └── workflows/
│       └── auto-update-n8n.yml  # Workflow de auto-actualización
├── Dockerfile                    # Configuración Docker con pdf-parse
├── render.yaml                   # Configuración de Render deployment
└── README.md                     # Este archivo
```

## 🤖 GitHub Actions Workflow

El workflow realiza:

1. **Checkout** del repositorio
2. **Actualiza** `CACHE_BUST` con fecha actual
3. **Commit** automático con mensaje descriptivo
4. **Push** a `main` (triggerea Render deployment)

**Permisos requeridos**: `contents: write` (ya configurado)

## 📊 Monitoreo

### Ver logs de deployment

Render Dashboard → `n8n-pdf` → Pestaña "Logs"

### Ver historial de workflows

https://github.com/RomanT300/n8n-render-pdf/actions

### Ver últimos commits

```bash
git log --oneline -10
```

## 🔐 Seguridad

- ✅ Basic Auth habilitado por defecto
- ⚠️ Cambiar credenciales en producción
- ✅ HTTPS forzado en Render
- ✅ Variables sensibles en env vars (no en código)

## 📚 Recursos

- [n8n Documentation](https://docs.n8n.io/)
- [Render Documentation](https://render.com/docs)
- [pdf-parse NPM](https://www.npmjs.com/package/pdf-parse)

## 🆘 Troubleshooting

### El deployment no se inicia

1. Verifica GitHub Actions: https://github.com/RomanT300/n8n-render-pdf/actions
2. Revisa Render Dashboard para errores
3. Ejecuta manualmente: "Manual Deploy" en Render

### n8n no se actualiza

1. Ejecuta workflow manualmente desde GitHub Actions
2. O actualiza `CACHE_BUST` manualmente y haz push

### Error al instalar pdf-parse

Verifica que el Dockerfile tenga:
```dockerfile
USER root
RUN npm install -g pdf-parse
USER node
```

## 📅 Historial de Cambios

- **2025-10-26**: Agregado sistema de auto-actualización con GitHub Actions
- **2025-07-05**: Deployment inicial en Render con pdf-parse

---

**Mantenido por**: GitHub Actions Bot 🤖  
**Última actualización**: Ver último commit en `main`
