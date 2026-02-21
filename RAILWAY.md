# Despliegue en Railway

## Configuración

Railway detectará automáticamente el `Dockerfile` en la raíz y desplegará la aplicación PHP + Nginx.

## Variables de entorno obligatorias

En **Railway** → tu servicio → **Variables** añade:

| Variable  | Descripción           | Ejemplo |
|-----------|-----------------------|---------|
| `DB_HOST` | Host de MySQL         | (del servicio MySQL) |
| `DB_USER` | Usuario de la BD      | `root` |
| `DB_PASS` | Contraseña            | (la que te da Railway) |
| `DB_NAME` | Nombre de la base     | `railway` |
| `AI_3D_SERVICE_URL` | URL del microservicio ai3d | `https://tu-ai3d.up.railway.app` |

## Microservicio IA 3D

1. **URL pública**: En Railway → servicio ai3d → Settings → Networking → activa **Generate domain**
2. **Variable en la app PHP**: `AI_3D_SERVICE_URL=https://TU-URL-DEL-MICROSERVICIO.up.railway.app`
3. Tras cambiar la variable, Railway redesplegará automáticamente.

## Puertos

Railway inyecta `PORT` automáticamente. La aplicación escucha en ese puerto.

## Importar schema

Tras crear la BD, ejecuta `database/schema.sql` contra tu MySQL de Railway (desde la consola de Railway o usando un cliente MySQL).
