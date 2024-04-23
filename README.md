# SO_DespliegueDocker
este repositorio  es con fines academicos, donde mostramos el Despliegue de la base de datos Postgres usando Docker

Descripción
Usted y su grupo de trabajo deberán llevar a cabo la ejecución de un contenedor de la base de datos Postgres de modo que los datos de la base de datos no queden almacenados en el contenedor. Es decir, que los datos deben quedar almacenados fuera del contenedor, por ejemplo: en un volumen de Docker o en un directorio del equipo anfitrión. Entonces, lo primero que deben validar es ¿En qué directorio Postgres por defecto guarda los datos de la base de datos? 
Adicionalmente, a través de su tarea se debe validar que sí una instancia de base de datos no existe entonces crear  una instancia de base de datos llamada tarea_db. Su base de datos debe contener una única tabla llamada pg_tabla la cual tiene dos campos, un campo id como clave de su tabla y un campo mensaje de tipo cadena de caracteres. Entonces, usted debe preparar todo lo concerniente a la ejecución de una instancia de base de datos de Postgres que almacene los datos de las bases de datos por fuera del contenedor y que cree un tabla inicial con los atributos descritos anteriormente.
A continuación se muestra una gráfica más detallada de lo que se tiene en mente usted y su grupo deben llevar a cabo. Debe crear dos contenedores, un contenedor de base de datos de Postgres (pg_server) y un contenedor cliente (pg_client). El contenedor pg_server tiene asociado un volumen de Docker (pg_db) donde almacena los datos de la base de datos. Ambos contenedores están conectados a una red de Docker llamada pg_network. La idea entonces es que desde el contenedor client se puedan enviar comandos al contenedor server y el server envíe de vuelta al client la respuesta a la consulta hecha por el client.


Validación
Para validar que todo funciona como se visualiza en la gráfica es lo siguiente:
Ejecutar el contenedor de la base de datos por primera vez y usando la versión de Postgres 15-bookworm mostrar que la base de datos ha sido creada. Hacer inserción de un registro en la base de datos cuyo valor en el campo mensaje sea ‘hola mundo’.
Detener la ejecución del contenedor que corre la versión Postgres 15-bookworm.
Ejecute ahora el cliente y ejecutar dentro de este contenedor lo siguiente:
Usando el comando psql conectarse a la base de datos que está en el servidor pg_server. El comando para conectarse remota a un servidor de base de datos usando psql debe tener los siguientes argumentos psql -h pg_server -p 5432 -U <DB_USER> tarea_db.
Haga un select sobre la tabla pg_tabla. Debería aparecer un único registro con el mensaje ‘hola mundo’.
Detener la ejecución de todos los contenedores.
Borrar los contenedores (pg_server, pg_client), el volumen (pg_db) y la red (pg_network) creados para esta tarea.
Usted deberá hacer un video donde intervengan tod@s l@s integrantes del grupo. 
Tener presente lo siguiente:
Los contenedores cuando se ejecutan deben estar conectados a la red pg_network.  Esto permitirá que ambos contenedores se conozcan por su nombre de contenedor.

ENLACE DEL VIDEO DE YOUTUBE:

MIGUEL ANGEL MORENO ROMERO 202125737
miguel.romero@correounivalle.edu.co

