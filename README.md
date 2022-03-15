# keepcoding-devops-cicd-local-pipelines-template

Materiales para la impartición del módulo "Ciclo de vida de un desarrollo: CI/CD" del bootcamp DevOps de KeepCoding.

Parte 1 del módulo: Pipelines locales

Este repositorio sirve de plantilla para cada vez que se imparta este módulo.

## Requisitos
- make  (Aseguraté de que haciendo `make --version` en tu terminal sale algo así `GNU Make 4.X [...]`)
- python3 (Aseguraté de que haciendo `python --version` en tu terminal sale algo así `Python 3.X.X`)
- pip3 (Aseguraté de que haciendo `pip --version` en tu terminal sale algo así `pip 20.X.X from [...] (python 3.X)`)
- docker (Asguraté de que puedes correr `docker run hello-world` sin problemas)
- Tener cuenta en docker hub https://hub.docker.com/
- Logarse en DockerHub vía consola de comandos con `docker login`
- Tener cuenta en https://pypi.org/

## Guión
- Crear aplicación python
- Crear los tests
- make build
- make unit-test
- Añadir lo de la cobertura
- make coverage
- Añadir lo edl paquetizado
- make package
- Añadir idempotencia: make clean
- Preparar la app para publicar
- make publish
- Ficheros docker
- make dockerize
- make integration test