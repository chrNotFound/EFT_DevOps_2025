# EFT DevOps 2025 - ISY1101

Proyecto de Evaluación Final Transversal para la asignatura **Introducción a Herramientas DevOps** (ISY1101) - Duoc UC 2025.

## Integrantes
- Iñigo Gómez
- Christian Troncoso

## Descripción
Plataforma de gestión de productos y usuarios con pipeline CI/CD completo desplegado en AWS. La aplicación está compuesta por tres componentes contenedorizados con Docker y orquestados en Amazon ECS Fargate.

## Arquitectura
## Componentes

| Componente | Tecnología | Puerto | Imagen Docker |
|---|---|---|---|
| Frontend | Java/Maven → Nginx Alpine | 80 | chrnotfound/eft-frontend |
| Backend Usuarios | Node.js/Express Alpine | 8081 | chrnotfound/eft-backjs |
| Backend Productos | Python/Flask Alpine | 8082 | chrnotfound/eft-backpy |
| Base de datos | MySQL 8.0 (Amazon RDS) | 3306 | — |

## Repositorios de componentes
- Frontend: https://github.com/chrNotFound/EFT_DevOps_2025/tree/main/Front
- Backend JS: https://github.com/chrNotFound/EFT_DevOps_2025/tree/main/backJs
- Backend Python: https://github.com/chrNotFound/EFT_DevOps_2025/tree/main/BackPy

## Imágenes Docker Hub
- `chrnotfound/eft-frontend:latest`
- `chrnotfound/eft-backjs:latest`
- `chrnotfound/eft-backpy:latest`

## Pipeline CI/CD
El pipeline de GitHub Actions (`.github/workflows/deploy.yml`) se ejecuta automáticamente en cada push a `main` y realiza:

1. **Build** — Construye las imágenes Docker de los 3 componentes
2. **Push** — Publica las imágenes en Docker Hub con dos tags:
   - Tag con SHA del commit (trazabilidad)
   - Tag `latest` (despliegue)

## Cómo ejecutar localmente

### Requisitos
- Docker Desktop instalado

### Pasos
```bash
git clone https://github.com/chrNotFound/EFT_DevOps_2025.git
cd EFT_DevOps_2025
docker-compose up --build
```

La aplicación estará disponible en:
- Frontend: http://localhost:80
- Backend Usuarios: http://localhost:8081
- Backend Productos: http://localhost:8082

## Despliegue en AWS

### Infraestructura
- **Clúster ECS:** eft-cluster (us-east-1, Fargate)
- **Base de datos:** eft-db (RDS MySQL 8.0, db.t3.micro)
- **Región:** us-east-1 (N. Virginia)

### Servicios ECS
- `eft-frontend` — Servicio del frontend
- `eft-backjs` — Servicio del backend de usuarios
- `eft-backpy` — Servicio del backend de productos

### Endpoints
- Frontend: http://18.234.75.183
- Backend Usuarios: http://54.164.231.77:8081/api/users
- Backend Productos: http://54.209.220.76:8082/api/products

## Seguridad
- Imágenes base Alpine (minimalistas)
- Dockerfiles multietapa (multi-stage builds)
- Archivos .dockerignore en cada componente
- Credenciales gestionadas con GitHub Secrets
- Security Groups con puertos mínimos expuestos
- Rol IAM LabRole con principio de mínimo privilegio

## Variables de entorno

### Backend Usuarios (backJs)
| Variable | Descripción |
|---|---|
| DB_HOST | Endpoint de RDS |
| DB_PORT | Puerto MySQL (3306) |
| DB_USER | Usuario de la BD |
| DB_PASSWORD | Contraseña de la BD |
| DB_NAME | Nombre de la BD (users_db) |

### Backend Productos (BackPy)
| Variable | Descripción |
|---|---|
| DB_HOST | Endpoint de RDS |
| DB_PORT | Puerto MySQL (3306) |
| DB_USER | Usuario de la BD |
| DB_PASSWORD | Contraseña de la BD |
| DB_NAME | Nombre de la BD (products_db) |

### Frontend
| Variable | Descripción |
|---|---|
| BACKEND_USERS_URL | URL del backend de usuarios |
| BACKEND_PRODUCTS_URL | URL del backend de productos |
