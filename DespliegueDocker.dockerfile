#Miguel Angel Moreno Romero 
#202125737 
#miguel.romero@correounivalle.edu.co

#Crear una red de Docker
docker network create pg_network

#Crear un volumen de Docker para el almacenamiento persistente
docker volume create pg_db

#Ejecutar el contenedor de Postgres (pg_server)
docker run -d --name pg_server --network pg_network -v pg_db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=123 postgres:latest

#Verificar si la base de datos tarea_db existe, y crearla si no
docker exec -it pg_server psql -U postgres

#Dentro del contenedor, verifica si la base de datos tarea_db existe, y creala si no es as
SELECT datname FROM pg_database WHERE datname = 'tarea_db';
CREATE DATABASE tarea_db;
# --> Salimos del contenedor Postgres con \q

#Crear la tabla pg_tabla en la base de datos tarea_db
docker exec -it pg_server psql -U postgres -d tarea_db -c "CREATE TABLE IF NOT EXISTS pg_tabla (id SERIAL PRIMARY KEY, mensaje VARCHAR(255));"

#Crear el contenedor cliente (pg_client)
docker run -it --name pg_client --network pg_network alpine sh

#Dentro del contenedor pg_client, instala psql
apk add --update postgresql-client

#Una vez instalado, puedes usar psql para conectarte al servidor de Postgres
psql -h pg_server -U postgres -d tarea_db

#Validacion

#Ejecutar el contenedor de Postgres con la version 15-bookworm
#Si necesitas re-crear el contenedor desde cero, sigue estos pasos
docker run -d --name pg_server --network pg_network -v pg_db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=123 postgres:15-bookworm

#--- Insertar el registro 'hola mundo' ---
#Conéctate al servidor de Postgres y asegurate de que la base de datos tarea_db existe. Si no, creala, y luego inserta el registro
docker exec -it pg_server psql -U postgres -c "CREATE DATABASE IF NOT EXISTS tarea_db;"

#docker exec -it pg_server psql -U postgres -d tarea_db -c "CREATE TABLE IF NOT EXISTS pg_tabla (id SERIAL PRIMARY KEY, mensaje VARCHAR(255));"
docker exec -it pg_server psql -U postgres -d tarea_db -c "INSERT INTO pg_tabla (mensaje) VALUES ('hola mundo');"

#Detener el contenedor de Postgres
docker stop pg_server

#Conectarse al servidor desde el cliente para verificar los datos
docker run -it --name pg_client --network pg_network alpine sh

apk add --update postgresql-client

#Conectate a la base de datos tarea_db en el contenedor pg_server y realiza una consulta para verificar si el registro "hola mundo" esta presente
psql -h pg_server -p 5432 -U postgres tarea_db

#Dentro de psql, realiza un SELECT para verificar el contenido de pg_tabla
SELECT * FROM pg_tabla;
#-->x Si todo esta correcto, deberias ver el registro con el mensaje "hola mundo".

#Detener y eliminar contenedores y recursos de Docker

docker stop pg_client pg_server
docker rm pg_client pg_server
docker volume rm pg_db
docker network rm pg_network

