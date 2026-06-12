# Fotaza

## Descripción

USUARIOS DE PRUEBA: 

USUARIO:  validador@gmail.com
CLAVE:    123456

USUARIO:  melisa@test.com
CLAVE:    melisa123

USUARIO:  nehuen@test.com
CLAVE:    12345



Fotaza es una aplicación web desarrollada con Node.js, Express, Sequelize y MySQL que permite a los usuarios compartir publicaciones con imágenes, comentar, valorar contenido, seguir otros usuarios, enviar mensajes privados y gestionar colecciones personales.

Además, el sistema cuenta con un rol de validador encargado de revisar publicaciones denunciadas por los usuarios.

---

## Tecnologías utilizadas

* Node.js
* Express
* Sequelize
* MySQL
* Pug
* Bootstrap
* Express Session
* Multer

---

## Instalación y ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/NehuenZ12/fotaza.git
```

### 2. Ingresar al proyecto

```bash
cd fotaza
```

### 3. Instalar dependencias

```bash
npm install
```

### 4. Crear la base de datos

Crear una base de datos MySQL con el nombre configurado en el proyecto.

Ejemplo:

```sql
CREATE DATABASE fotaza;
```

### 5. Configurar la conexión

Modificar los datos de conexión en el archivo correspondiente de Sequelize:

* Usuario
* Contraseña
* Nombre de la base de datos
* Puerto

### 6. Ejecutar la aplicación

```bash
npm start
```

o

```bash
node app.js
```

### 7. Acceder desde el navegador

```text
http://localhost:3000
```

---

## Funcionalidades implementadas

### Usuarios

* Registro de usuarios.
* Inicio y cierre de sesión.
* Perfil de usuario.
* Seguimiento de usuarios.

### Publicaciones

* Creación de publicaciones.
* Subida de imágenes.
* Etiquetas.
* Valoraciones.
* Comentarios.
* Denuncias.

### Interacción

* Mensajes privados.
* Notificaciones.
* Publicaciones de usuarios seguidos.
* Interés en publicaciones.

### Colecciones

* Creación de colecciones.
* Guardado de publicaciones.
* Prevención de publicaciones duplicadas dentro de una misma colección.

### Moderación

* Denuncia de publicaciones.
* Denuncia de comentarios.
* Rol de validador.
* Revisión y moderación de contenido denunciado.

---

## Problemas encontrados durante el desarrollo

### 1. Organización de las vistas Pug

Durante el desarrollo se produjeron varios problemas relacionados con la indentación de Pug. Debido a que Pug utiliza la indentación para definir la estructura de la página, algunos componentes quedaron anidados incorrectamente dentro de otros bloques.

**Solución:** Se revisó la estructura de las vistas y se corrigieron los niveles de indentación para asegurar que cada componente se mostrara correctamente.

### 2. Gestión de sesiones

Al reiniciar el servidor algunos usuarios permanecían visualmente dentro de la aplicación aunque la sesión ya no existía.

**Solución:** Se implementó un middleware de verificación de sesión que redirige automáticamente al login cuando no existe una sesión activa.

### 3. Organización de conversaciones

Inicialmente cada mensaje aparecía como una conversación independiente.

**Solución:** Se agruparon los mensajes por usuario para mostrar una única conversación por contacto, mejorando la experiencia de uso.

### 4. Publicaciones duplicadas en colecciones

Un usuario podía intentar guardar varias veces una misma publicación en una colección.

**Solución:** Se agregó una verificación previa antes de guardar la relación entre colección y publicación para evitar duplicados.

### 5. Visualización de publicaciones

Las publicaciones no siempre aparecían ordenadas correctamente.

**Solución:** Se implementó ordenamiento por fecha de creación para mostrar primero las publicaciones más recientes.

---

## Autor

Proyecto desarrollado por Nehuen para la materia Web 2.
