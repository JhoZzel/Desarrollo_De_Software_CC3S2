# Examen Sustitutorio
- Chavez Chico Joel Jhotan 20210058J

## Parte 1: El ciclo de prueba de aceptación- prueba unitaria
Primero cambiamos al directorio rottenpotatoes donde trabajaremos e instalamos las gemas
![](img/1.png)
Migramos la base de datos y configuramos la semilla para mostrar los primeros datos
![](img/2.png)
![](img/3.png)
Vemos que ya se esta desplegando en nuestro navegador.
![](img/4.png)

Ahora vamos a ejecutar las pruebas de cucumber del archivo `features/movies_by_director.feature`. Para ello hacemos un `bundle exec cucumber` y vemos que aparece en consola.
![](img/5.png)
![](img/6.png)

Se buscar agregar un nuevo campo a la tabla para ello crearemos un archivo de migraciones, con el siguiente comando, y luego hacemos la migracion.
![](img/7.png)
![](img/8.png)

Si nos dirigimos a la consola de rails, y seleccionamos cualquier fila de la tabla vemos que el campo director ha sido creado y para esta movie ha sido colocada como `nil`.
![](img/9.png)





## Parte 3: JavaScript
### Pregunta 02:
Usamos el codigo proporcionado y creamos nuestro archivo `index.html`, vemos que se visualiza en el navegador, pero aun falta el codigo en JS.
![](img/b.png)
Para ello agregamos una etiqueta script dentro del index y agregamos el siguiente codigo
```html
 <script>
    document.addEventListener('DOMContentLoaded', function () {
      const form = document.forms['myform'];
      const emailInput = form.elements['email'];
      const passwordInput = form.elements['password'];
      const userNameInput = form.elements['userName'];
      const emailError = document.getElementById('emailError');
      const passwordError = document.getElementById('passwordError');
      const userNameError = document.getElementById('userNameError');
      let hasError = false;

      form.addEventListener('submit', function (event) {
        event.preventDefault();
        emailError.classList.add('hide');
        passwordError.classList.add('hide');
        userNameError.classList.add('hide');
        hasError = false;

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(emailInput.value)) {
          handleError(emailError, 'Invalid email address');
        }

        const passwordRegex = /^[a-zA-Z0-9]{3,8}$/;
        if (!passwordRegex.test(passwordInput.value)) {
          handleError(passwordError, 'Invalid password');
        }


        if (!hasError) {
          const formData = {};
          for (const input of form.elements) {
            if (input.name) {
              formData[input.name] = input.value;
            }
          }
          console.log('Form data:', formData);
        }
      });

      function handleError(errorElement, errorMessage) {
        errorElement.textContent = errorMessage;
        errorElement.classList.remove('hide');
        hasError = true;
      }
    });
  </script>
```
Primero implemtamos `document.addEventListener('DOMContentLoaded', function () {...}`, luego se selecciona elementos del formulario, y se obtiene referencias a campos de entrada y mensajes de error mediante `document.forms`, `form.elements` y `document.getElementById`. Agregamos un listener con `form.addEventListener('submit', function (event) {...}`. Se previene el comportamiento predeterminado del formulario con `event.preventDefault()`.
Ahora segun como se menciona en el enunciado validamos el correo electrónico y la contraseña, para ello se utiliza expresiones regulares con `test()` para verificar el formato del correo y la contraseña. Manejamos errores con la función `handleError` actualiza el contenido y visibilidad de mensajes de error. Finalmente se recopila datos del formulario y se crea un objeto `formData` con los valores de los campos del formulario. Luego se imprime los datos en la consola con `console.log('Form data:', formData)`.

Vamos a mostrar los resultados en las siguientes capturas, primero vamos a ingresar datos incorrectos con el fin de que el validate este funcionando correctamente.

![](img/c.png)

Como se muestra en la figura anterior, vemos que hemos ingresado un correo invalida y se ha logrado mostrar el mensaje de `Invalid email address`, asimismo lo mismo ocurre con el campo de contraseña ya que hemos ingresado mas caracteres de lo debido `Invalid password`. 

Ahora bien vamos a ingresar los datos correctamente, y observemos la consola del navegador para ver si ha podido registar los datos.

![](img/d.png)

Vemos que ahora si no se ha mostrado ningun error y la consola imprime los resultados como `Form-tag`
![](img/e.png)

