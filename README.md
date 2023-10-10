# fspt18-team-3

Más adelante, cuando quieras ejecutar migraciones, necesitarás ejecutar en tu terminal  `npm run migrate`.

///////////////////////////////////

Ejecuta `npm install` en la carpeta del proyecto para instalar las dependencias relacionadas con Express (el servidor).

Haz `cd client` y ejecuta `npm install` para instalar las dependencias relacionadas con React (el cliente).

Para crear la base de datos:

Crea un archivo `.env`  en la carpeta del proyecto y añade

```
DB_NAME=medication 
DB_PASS=YOUR_PASSWORD
BCRYPT_WORK_FACTOR = 12 ------>(Para que funcione la authentication)
```

(reemplaza `YOUR_PASSWORD` con tu contraseña)

En la consola de MySQL, ejecuta `create database pregnancy;` para crear una base de datos en MySQL.

nombre de la base de datos: "pregnancy"
nombre de la table: "users"

Ejecuta lo siguiente en la consola de MySQL: `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'YOUR_PASSWORD';` (reemplaza `YOUR_PASSWORD` con tu contraseña)

Ejecuta `node model/database.js` en tu  **TERMINAL**, en la carpeta del  **proyecto**  (¡no en tu consola de MySQL! Abre una nueva ventana de la terminal para esto). Esto creará dos tablas llamada 'pills' y 'daily_pills' en tu base de datos.

Para ejecutar los servidores de desarrollo: 
- Ejecuta `npm start` en la carpeta del proyecto para iniciar el servidor de Express 
- Haz `cd client` y ejecuta `npm run dev` para iniciar el servidor del cliente 

## Otras dependencias que instalar

Multer para guardar imagenes -> npm install --save multer
UUID para renombrar archivos -> npm install uuid
Mime para la extensión de los archivos -> npm install mime-types
Axios para las fetch requests en el frontend (cd client) -> npm install axios

npm install bcrypt
npm install jsonwebtoken
