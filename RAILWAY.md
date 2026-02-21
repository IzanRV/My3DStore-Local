# Despliegue en Railway

## Configuración

Railway detectará automáticamente el `Dockerfile` en la raíz y desplegará la aplicación PHP + Nginx.

## Variables de entorno obligatorias

En **Railway** → tu servicio → **Variables** añade:

| Variable  | Descripción           | Ejemplo (MySQL Railway) |
|-----------|-----------------------|---------------------------|
| `DB_HOST` | Host de MySQL         | `containers-us-west-xxx.railway.app` |
| `DB_USER` | Usuario de la BD      | `root` |
| `DB_PASS` | Contraseña            | (la que te da Railway) |
| `DB_NAME` | Nombre de la base     | `railway` |

## Base de datos MySQL

1. En tu proyecto Railway → **New** → **Database** → **MySQL**
2. Railway crea el servicio y te da las variables de conexión
3. Referencia esas variables en tu servicio web (o copia los valores a las variables de arriba)

## Puertos

Railway inyecta `PORT` automáticamente. La aplicación escucha en ese puerto.

## Importar schema

Tras crear la BD, ejecuta `database/schema.sql` contra tu MySQL de Railway (desde la consola de Railway o usando un cliente MySQL).
