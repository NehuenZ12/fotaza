Fotaza
Descripción

Fotaza es una aplicación web desarrollada en Node.js que permite a los usuarios compartir imágenes, interactuar con publicaciones y administrar contenido multimedia.

La aplicación incluye funcionalidades de publicación de imágenes, comentarios, valoraciones, seguimiento de usuarios, mensajería privada, notificaciones, colecciones de favoritos y herramientas de moderación de contenido.

Tecnologías utilizadas
Node.js
Express
PostgreSQL
Sequelize ORM
Pug
Bootstrap 5
Multer
Instalación

1. Clonar el proyecto
git clone <url-del-repositorio>

2. Instalar dependencias
npm install

3. Configurar PostgreSQL

Crear una base de datos PostgreSQL y actualizar los datos de conexión en:

src/config/database.js

Ejemplo:

database: 'fotaza',
username: 'postgres',
password: 'tu_password',
host: 'localhost',
dialect: 'postgres'

4. Crear las tablas

Ejecutar las consultas SQL correspondientes incluidas durante el desarrollo del proyecto.

5. Iniciar la aplicación
npm start

o

node src/app.js

La aplicación estará disponible en:

http://localhost:3000
Funcionalidades implementadas
Gestión de usuarios
Registro de usuarios.
Inicio y cierre de sesión.
Perfil de usuario.
Publicaciones
Creación de publicaciones.
Subida de múltiples imágenes.
Etiquetas.
Licencias de uso.
Marca de agua.
Interacciones
Comentarios.
Valoraciones.
Seguimiento de usuarios.
Mensajería privada.
Notificaciones
Notificación por seguimiento.
Notificación por comentarios.
Notificación por valoraciones.
Marcado de notificaciones como leídas.
Búsqueda
Búsqueda por etiquetas.
Búsqueda por título.
Búsqueda por descripción.
Colecciones
Creación de colecciones personalizadas.
Guardado de publicaciones en colecciones.
Visualización de colecciones privadas.
Prevención de duplicados.
Moderación
Denuncia de imágenes.
Denuncia de comentarios.
Gestión de publicaciones reportadas.
Problemas encontrados y soluciones
Gestión de relaciones entre entidades

Durante el desarrollo fue necesario relacionar publicaciones, imágenes, etiquetas, comentarios, valoraciones y colecciones. Se resolvió utilizando tablas intermedias y consultas mediante Sequelize.

Sistema de búsquedas

Inicialmente la búsqueda solamente funcionaba mediante etiquetas. Posteriormente se amplió para permitir búsquedas por título y descripción de publicaciones.

Manejo de sesiones

Se presentaron inconvenientes al acceder a determinadas funcionalidades sin sesión iniciada. Se solucionó verificando la existencia del usuario autenticado antes de ejecutar consultas dependientes de la sesión.

Organización de vistas Pug

Se detectaron errores de indentación que afectaban la visualización de la aplicación. Se reorganizó la estructura de las vistas respetando la jerarquía requerida por Pug.

Gestión de colecciones

Fue necesario evitar que una misma publicación pudiera guardarse varias veces dentro de una colección. Se solucionó verificando previamente la existencia de la relación antes de crear un nuevo registro.