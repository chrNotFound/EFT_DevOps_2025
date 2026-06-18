# EFT DevOps 2025 - ISY1101

Proyecto de Evaluación Final Transversal para la asignatura Introducción a Herramientas DevOps.

## Integrantes
- Iñigo Gómez
- Christian TroncosoS

## Descripción
Plataforma de gestión de productos y usuarios compuesta por:
- **Frontend:** Java (Maven) → genera HTML/CSS/JS estático servido con Nginx
- **Backend Users:** Node.js (Express) - Puerto 8081
- **Backend Products:** Python (Flask) - Puerto 8082
- **Base de datos:** MySQL 8.0

## Repositorios
- Frontend: https://github.com/chrNotFound/EFT_DevOps_2025/tree/main/Front
- Backend JS: https://github.com/chrNotFound/EFT_DevOps_2025/tree/main/backJs
- Backend Python: https://github.com/chrNotFound/EFT_DevOps_2025/tree/main/BackPy

## Imágenes Docker Hub
- `chrnotfound/eft-frontend:latest`
- `chrnotfound/eft-backjs:latest`
- `chrnotfound/eft-backpy:latest`

## Cómo ejecutar localmente
```bash
docker-compose up --build
```

## Pipeline CI/CD
El pipeline de GitHub Actions realiza automáticamente:
1. Build de las imágenes Docker
2. Push a Docker Hub con tag del commit SHA
3. Deploy a AWS ECS

## Despliegue en AWS
- **Clúster ECS:** eft-cluster (us-east-1)
- **Frontend:** http://54.80.178.146
- **Infraestructura:** AWS Fargate (Serverless)