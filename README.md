# Blog Full-Stack con Spring Boot, Angular y MySQL

Aplicación CRUD de posts con frontend en Angular, backend REST en Spring Boot y base de datos MySQL, preparada para ejecutarse con Docker Compose.

## Stack

- Backend: Spring Boot 4, Spring Web MVC, Spring Data JPA
- Frontend: Angular 21
- Base de datos: MySQL 8
- Servidor web y proxy: NGINX
- Contenedorización: Docker Compose

## Arquitectura

```text
blog-serv/
├── backend/              # API REST y acceso a datos
├── frontend/             # SPA en Angular + NGINX
├── docs/screenshots/     # Capturas de la aplicación
└── docker-compose.yml    # Orquestación de servicios
```

## Funcionalidades

- Listado de posts en formato tarjeta
- Búsqueda por título, contenido o categoría
- Creación de posts
- Edición de posts existentes
- Vista detalle de cada post
- Eliminación con confirmación

## Capturas

### Listado de posts

![Listado de posts](docs/screenshots/post-list.png)

### Crear post

![Formulario de creación de post](docs/screenshots/post-create.png)

### Detalle de post

![Detalle de un post](docs/screenshots/post-detail.png)

### Editar post

![Formulario de edición de post](docs/screenshots/post-edit.png)

## Requisitos

- Docker
- Docker Compose
- Java 21 y Maven Wrapper, si quieres ejecutar el backend en local
- Node.js 20+, si quieres ejecutar el frontend en local

## Ejecución con Docker

Desde la raíz del proyecto:

```bash
docker compose up -d --build
```

Servicios expuestos:

- Frontend: `http://localhost:4201`
- Backend: `http://localhost:8084/api/posts`
- MySQL: `localhost:3308`

Para detener el entorno:

```bash
docker compose down
```

## Desarrollo local

### Backend

Si ejecutas el backend fuera de Docker, la conexión a MySQL debe apuntar al puerto publicado por Compose (`3308`).

```bash
cd backend
./mvnw spring-boot:run
```

### Frontend

```bash
cd frontend
npm install
npm start
```

El servidor de desarrollo de Angular arranca por defecto en `http://localhost:4200`.

## Configuración relevante

- `docker-compose.yml`: define los servicios `mysql`, `spring-app` y `angular-web`
- `backend/src/main/resources/application.properties`: configuración de la conexión JDBC y JPA
- `frontend/nginx.conf`: proxy inverso hacia Spring Boot y soporte para rutas SPA

## Notas

- El backend dentro de Docker se conecta a MySQL usando el host interno `mysql:3306`
- El frontend en producción se sirve mediante NGINX en el contenedor `angular-web`
