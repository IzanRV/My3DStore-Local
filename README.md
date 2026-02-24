# MEMORIA DEL PROYECTO

# My3DStore

------------------------------------------------------------------------

# 1. Introducción

My3DStore es una aplicación web orientada a usuarios particulares que
permite buscar, visualizar y adquirir productos diseñados para impresión
3D. El sistema combina funcionalidades propias de un comercio
electrónico moderno con herramientas específicas del ámbito de la
fabricación aditiva.

El proyecto integra:

-   Gestión completa de usuarios.
-   Catálogo dinámico de productos.
-   Visualización y gestión de modelos STL/GLB.
-   Carrito y sistema de pedidos.
-   Panel de administración.
-   Automatización mediante scraping.
-   Microservicio independiente de Inteligencia Artificial.
-   Arquitectura basada en contenedores Docker.
-   Despliegue en entorno cloud (Railway).

------------------------------------------------------------------------

# 2. Contexto y Justificación

El mercado de la impresión 3D ha crecido considerablemente en los
últimos años. Sin embargo, muchas plataformas permiten descargar modelos
pero no ofrecen una experiencia completa de personalización y compra
centralizada.

My3DStore surge como una solución que combina:

-   Experiencia de e-commerce tradicional.
-   Gestión directa de archivos imprimibles.
-   Automatización de catálogo.
-   Integración de IA para enriquecer contenido.

------------------------------------------------------------------------

# 3. Objetivos del Proyecto

## 3.1 Objetivo General

Desarrollar una plataforma web funcional y escalable que permita vender
productos imprimibles en 3D, incorporando inteligencia artificial y
arquitectura modular.

## 3.2 Objetivos Específicos

-   Implementar autenticación segura.
-   Diseñar catálogo dinámico.
-   Crear carrito y checkout funcional.
-   Desarrollar panel de administración.
-   Integrar microservicio de IA desacoplado.
-   Automatizar importación de productos.
-   Desplegar el sistema en entorno cloud.

------------------------------------------------------------------------

# 4. Análisis de Requisitos

## 4.1 Requisitos Funcionales

-   Registro, login y logout.
-   Gestión de cuenta.
-   Catálogo de productos.
-   Visualización y descarga de STL.
-   Carrito de compra.
-   Checkout.
-   Gestión de pedidos.
-   Panel administrativo.
-   Integración con microservicio IA.
-   Sistema de scraping automatizado.

## 4.2 Requisitos No Funcionales

-   Interfaz minimalista (azul/blanco).
-   Seguridad en contraseñas.
-   Arquitectura desacoplada.
-   Escalabilidad horizontal.
-   Preparación para HTTPS.
-   Disponibilidad 24/7.

------------------------------------------------------------------------

# 5. Arquitectura del Sistema

La arquitectura se basa en microservicios y contenedores Docker.

## Servicios principales

1.  Base de datos MySQL 8.
2.  Backend PHP (MVC).
3.  Servidor Nginx (Frontend).
4.  Microservicio IA (Python + FastAPI).
5.  Servicio auxiliar Python.

## Flujo de comunicación

Frontend → Backend → Base de Datos\
Backend → Microservicio IA

Todos los servicios se comunican mediante red interna Docker.

------------------------------------------------------------------------

# 6. Backend (PHP - MVC)

El backend está estructurado siguiendo el patrón MVC:

-   Models: gestión de datos.
-   Controllers: lógica de negocio.
-   Views: interfaz.

El sistema utiliza enrutamiento por parámetro `?action=` para gestionar
cada funcionalidad.

------------------------------------------------------------------------

# 7. Base de Datos

La base de datos MySQL almacena:

-   Usuarios.
-   Productos.
-   Categorías.
-   Pedidos.
-   Detalles de pedido.
-   Carrito.

Se inicializa mediante `schema.sql` automáticamente al levantar el
contenedor.

------------------------------------------------------------------------

# 8. Microservicio de Inteligencia Artificial

Desarrollado en Python con FastAPI.

Funciones:

-   Mejora automática de descripciones.
-   Procesamiento de datos IA.
-   Gestión de tareas.

Comunicación interna mediante:

AI_3D_SERVICE_URL=http://ai3d:8000

El microservicio está completamente desacoplado del backend principal.

------------------------------------------------------------------------

# 9. Sistema de Importación Automatizado

Se desarrolló un script que:

1.  Consulta modelos mediante GraphQL.
2.  Descarga imágenes.
3.  Descarga archivos STL.
4.  Mejora descripciones con IA.
5.  Inserta productos en la base de datos.

Incluye:

-   Logs.
-   Control de errores.
-   Sistema de fallback.
-   Control de duplicados.

------------------------------------------------------------------------

# 10. Seguridad

-   Cifrado de contraseñas.
-   Validación de sesión.
-   Protección de rutas administrativas.
-   Separación de red interna.
-   Preparación para HTTPS.

------------------------------------------------------------------------

# 11. Docker y Contenedores

Se utiliza Docker Compose para levantar:

-   db
-   backend
-   frontend
-   ai3d
-   python

Ventajas:

-   Entorno reproducible.
-   Modularidad.
-   Aislamiento.
-   Escalabilidad.

------------------------------------------------------------------------

# 12. Despliegue en Railway

El proyecto ha sido desplegado en Railway utilizando arquitectura basada
en contenedores independientes.

Se desplegaron:

-   Un contenedor para la base de datos MySQL.
-   Un contenedor independiente para el microservicio de IA.
-   Un contenedor para la aplicación web (backend + frontend).

Esto permite:

-   Escalar cada servicio de forma independiente.
-   Separar responsabilidades.
-   Mejorar disponibilidad.
-   Facilitar mantenimiento.

Railway gestiona:

-   Variables de entorno.
-   Redes internas.
-   Puertos dinámicos.
-   Persistencia de base de datos.

------------------------------------------------------------------------

# 13. Problemas Encontrados

-   Conflictos de puertos locales.
-   Problemas en descarga de STL.
-   Ajustes en comunicación entre contenedores.
-   Configuración de variables de entorno en Railway.
-   Manejo de persistencia de datos en entornos cloud.

Cada problema fue resuelto mediante ajustes técnicos y pruebas
iterativas.

------------------------------------------------------------------------

# 14. Mejoras Futuras

-   Pasarela de pago real.
-   Sistema de recomendaciones.
-   Personalización 3D avanzada.
-   Implementación de caché.
-   Balanceador de carga.
-   Dominio propio y certificado SSL.

------------------------------------------------------------------------

# 15. Diario de Desarrollo con IA

Durante el desarrollo se utilizó inteligencia artificial como
herramienta de apoyo técnico.

La IA ayudó en:

-   Configuración de Docker.
-   Implementación de FastAPI.
-   Resolución de errores.
-   Optimización de scraping.
-   Mejora automática de descripciones.

Sin embargo, fue necesario revisar y adaptar el código generado,
especialmente en:

-   Configuración de red entre contenedores.
-   Variables de entorno en Railway.
-   Manejo de errores en descargas externas.

Las decisiones finales de arquitectura fueron tomadas manualmente tras
análisis crítico.

------------------------------------------------------------------------

# 16. Conclusión

My3DStore es un proyecto completo que integra:

-   Desarrollo backend estructurado.
-   Microservicios.
-   Base de datos relacional.
-   Contenedores Docker.
-   Despliegue en Railway.
-   Inteligencia artificial.

La arquitectura modular y desacoplada permite escalar el sistema y
evolucionarlo hacia una solución comercial real.
