# Despliegue en Railway

## Configuración

Railway detectará automáticamente el `Dockerfile` en la raíz y desplegará la aplicación PHP + Nginx.

## Variables de entorno

### Base de datos (automático con MySQL de Railway)

Si añades **MySQL** como base de datos en el mismo proyecto, usa **Add Reference** en Variables para referenciar las variables del servicio MySQL. La app admite:

- **Railway MySQL**: `MYSQLHOST`, `MYSQLUSER`, `MYSQLPASSWORD`, `MYSQLDATABASE`, `MYSQLPORT`
- **Manual**: `DB_HOST`, `DB_USER`, `DB_PASS`, `DB_NAME`, `DB_PORT`

### Microservicio IA 3D

| Variable              | Descripción                          |
|-----------------------|--------------------------------------|
| `AI_3D_SERVICE_URL`   | URL pública del microservicio ai3d   |

## Base de datos MySQL

1. En tu proyecto Railway → **New** → **Database** → **MySQL**
2. En el servicio web → **Variables** → **Add Reference** → selecciona el servicio MySQL
3. Esto inyecta `MYSQLHOST`, `MYSQLUSER`, etc. automáticamente

## Puertos

Railway inyecta `PORT` automáticamente. La aplicación escucha en ese puerto.

## Importar schema

Tras crear la BD, ejecuta `database/schema.sql` contra tu MySQL de Railway (desde la consola de Railway o usando un cliente MySQL).
