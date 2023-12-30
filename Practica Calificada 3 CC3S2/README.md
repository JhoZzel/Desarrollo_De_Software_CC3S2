# PC03-CC3S2-Grupo-07
## Tema: Introducción a Rails: Agrega funciones a RottenPotatoes

- Chavez Chico Joel Jhotan 20210058J
- Espinoza Pari Franklin 20210135D
- Pisfil Puicon Angello Jamir 20210035J

## Configuración del Github
Primero vamos a crear nuestro repositorio de trabajo, bajo el nombre de `PC03-CC3S2-Grupo-07`, y vamos a agregar a nuestros colaboradores de proyecto.
![](img/1.png)
![](img/2.png)

Ahora bien, necesitaremos inicializar nuestro proyecto usando el comando git init para establecer un sistema de control de versiones Git en el directorio de nuestro proyecto. Este proceso es crucial para realizar un seguimiento eficiente de los cambios en nuestros archivos a lo largo del tiempo y facilitar la colaboración entre los miembros de nuestro equipo.

![](img/3.png)

Luego vamos a clonar el repositorio sobre el cual trabajaremos el cual se indica en la guía de la práctica.

![](img/4.png)

Una vez hecho esto, ejecutamos `git add` para seleccionar los cambios que queremos incluir en el próximo commit y luego usamos `git commit` para crear un registro permanente de esos cambios con un mensaje descriptivo. Este proceso se repite a medida que desarrollamos, construyendo un historial de versiones estructurado y significativo en nuestro repositorio Git.

![](img/5.png)

Ahora, ejecutamos un `git branch`, para poder crear una nueva rama en nuestro repositorio. Luego, con `git remote`, establecemos conexiones con repositorios remotos, como GitHub, para facilitar la colaboración y compartir nuestro código. Finalmente, al usar `git push`, subimos nuestros commits al repositorio remoto, asegurando que otros colaboradores puedan acceder a nuestros cambios y mantener una versión actualizada del proyecto.

![](img/6.png)
![](img/7.png)
![](img/8.png)


Una vez establecida la infraestructura inicial de nuestro proyecto, procederemos con la ramificación del repositorio. Esta fase implica la creación de ramas específicas para cada integrante del equipo, dividiendo el desarrollo en partes distintas. Crearemos nuestra primera rama como se muestra a continuación:

![](img/9.png)
![](img/10.png)


Usando el `git branch Parte01-Joel` pudimos crear una nueva rama llamada `Parte01-Joel`. Luego, se realiza un cambio a esta nueva rama con el comando `git checkout Parte01-Joel`.

Ahora bien, vamos a trabajar en esta rama siguiendo las demás instrucciones de la guía. Para comenzar, se indica que ejecutemos el comando `bundle install --without production`. Este comando se utiliza para instalar las gemas y dependencias especificadas en el archivo `Gemfile`, excluyendo aquellas relacionadas con el entorno de producción.

![](img/11.png)
![](img/12.png)


Finalmente, ejecutamos la migración inicial mediante el comando bin/rake db:migrate. Esta acción, al ser la primera migración, también implica la creación de la base de datos.

![](img/13.png)

**Pregunta**: ¿Cómo decide Rails dónde y cómo crear la base de datos de desarrollo? (Sugerencia: verifica los subdirectorios db y config)

**Respuesta**
Rails utiliza la configuración del archivo config/database.yml para determinar dónde y cómo crear la base de datos de desarrollo. En este archivo, podemos encontrar configuraciones para diferentes entornos, como desarrollo, prueba y producción. Por defecto, las configuraciones para el entorno de desarrollo se encuentran bajo la clave development.



**Pregunta**: ¿Qué tablas se crearon mediante las migraciones?

**Respueta:**
La migración `20150809022253_create_movies.rb` crea la tabla `Movies` en la base de datos. Esta tabla contendrá la información relacionada con las películas. Al ejecutar la migración, se establecen las columnas y sus tipos de datos correspondientes, definiendo así la estructura de la tabla. Los detalles específicos de la tabla `Movies` estarán definidos en el contenido de la migración, como por ejemplo, los campos para el título de la película, la fecha de lanzamiento, el director, y cualquier otro atributo relevante.

Ahora vamos a insertar *datos semilla* en la BD, mediante el comando `rake db:seed`.
![](img/14.png)


**Pregunta** ¿Qué datos de semilla se insertaron y dónde se especificaron? (Pista: rake -T db:seed explica la tarea de semilla, rake -T explica otras tareas de Rake disponibles)

En el archivo `/db/seeds.rb`, se especifican los datos de semilla que se insertarán en la base de datos cuando se ejecute el comando `rake db:seed`. Este archivo contiene una serie de hashes que representan películas con sus respectivos atributos, como título, clasificación y fecha de lanzamiento. Aquí, se están creando registros para películas como 'Aladdin', 'The Terminator', 'When Harry Met Sally', entre otras.
```rb
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
  	 ]

movies.each do |movie|
  Movie.create!(movie)
end
```

Cada hash dentro del arreglo `movies` representa un conjunto de datos para una película específica. La tarea de semilla (`rake db:seed`) utiliza estos datos para poblar la base de datos con valores iniciales. La estructura del archivo de semilla permite la creación eficiente de registros en la base de datos cuando sea necesario inicializarla con datos predefinidos.

Muy bien ahora vamos a desplegar nuestra app para poder visualizarla en nuestra máquina local, con ayuda del comando `rails server`

![](img/15.png)

Se puede observar que se ha iniciado el servidor de desarrollo de Rails. Al arrancar, el servidor informa que está utilizando WEBrick como servidor web y que la aplicación Rails 4.2.11 está en ejecución en el entorno de desarrollo. La aplicación estará disponible para su visualización en la dirección http://localhost:3000, así que nos dirigimos a dicho puerto desde el navegador para poder observar.

![](img/16.png)


## Parte 1: filtrar la lista de películas por clasificación

En esta primera parte, se procede a crear la sección de filtrado en el formulario, realizando modificaciones en el archivo `index.html.erb`. El código agregado introduce un formulario que incluye casillas de verificación para cada clasificación MPAA disponible. Estas casillas permitirán al usuario filtrar la lista de películas según sus preferencias de clasificación.

```html
<!--  This file is app/views/movies/index.html.erb -->
<h2>All Movies</h2>

<%= form_tag movies_path, method: :get, id: 'ratings_form' do %>
  <div class="form-group">
    <%= label_tag 'Include:' %>
    <% Movie.all_ratings.each do |rating| %>
      <div class="form-check form-check-inline">
        <%= label_tag "ratings[#{rating}]", rating, class: 'form-check-label' %>
        <%= check_box_tag "ratings[#{rating}]", "1", @ratings_to_show.nil? ? true : @ratings_to_show.include?(rating), class: 'form-check-input' %>
      </div>
    <% end %>
  </div>
  <%= submit_tag 'Refresh', id: 'ratings_submit', class: 'btn btn-primary' %>
<% end %>


<table class="table table-striped col-md-12" id="movies">
  <thead>
    <tr>
      <th>Movie Title</th>
      <th>Rating</th>
      <th>Release Date</th>
      <th>More Info</th>
    </tr>
  </thead>
  <tbody>
    <% @movies.each do |movie| %>
      <tr>
        <td>
          <%= movie.title %>
        </td>
        <td>
          <%= movie.rating %>
        </td>
        <td>
          <%= movie.release_date %>
        </td>
        <td>
          <%= link_to "More about #{movie.title}", movie_path(movie) %>
        </td>
      </tr>
    <% end %>
  </tbody>
</table>
<%= link_to 'Add new movie', new_movie_path, :class => 'btn btn-primary' %>
```
Las casillas de verificación se generan dinámicamente a partir de las clasificaciones disponibles en el modelo `Movie`. El formulario también incluye un botón "Refresh" que, al ser presionado, actualizará la lista de películas según las clasificaciones MPAA seleccionadas.

Sin embargo aún hay detalles que falta cambiar, es así en movie.rb (app/models/movie.rb), definimos un método de clase all_ratings en el modelo Movie. Este método devuelve un array con todas las clasificaciones posibles ('G', 'PG', 'PG-13', 'R'). Este método se convierte en un método de clase porque se llama directamente en la clase Movie y no en una instancia de la clase. 

```rb
# app/models/movie.rb
class Movie < ActiveRecord::Base
  def self.all_ratings
    # Devuelve un array con todas las clasificaciones posibles
    ['G', 'PG', 'PG-13', 'R']
  end
end
```

Luego, en movies_controller.rb, específicamente en la acción index, asignas la variable de instancia @all_ratings con el resultado de llamar al método all_ratings del modelo Movie. Esta variable se utilizará en la vista para generar las casillas de verificación del formulario de filtrado.

```RB
# app/controllers/movies_controller.rb
def index
  @movies = Movie.all
  @all_ratings = Movie.all_ratings
end
```

Ahora, en nuestra vista `index.html.erb`, el formulario utiliza `@all_ratings` para generar dinámicamente las casillas de verificación. Esto permite que el usuario seleccione las clasificaciones MPAA con las cuales desea filtrar la lista de películas.

**Pregunta**: ¿Por qué el controlador debe configurar un valor predeterminado para @ratings_to_show incluso si no se marca nada?

**Respuesta**:
El controlador debe configurar un valor predeterminado para `@ratings_to_show` incluso si no se marca nada porque este valor determina si las casillas de verificación deben mostrarse como marcadas o no en la vista. La documentación de Rails para `check_box_tag` indica que el tercer valor, que en este caso es `@ratings_to_show.include?(rating)`, evalúa si la casilla de verificación debe mostrarse marcada.

Si no se configura un valor predeterminado para `@ratings_to_show`, y el usuario no ha marcado ninguna casilla previamente, `@ratings_to_show` sería `nil`. En este caso, al evaluar `nil.include?(rating)` en la vista, se produciría un error, ya que `nil` no es una colección enumerable.

Al configurar un valor predeterminado, como incluir todas las clasificaciones posibles ('G', 'PG', 'PG-13', 'R'), se garantiza que, incluso si el usuario no ha marcado ninguna casilla, `@ratings_to_show` sea una colección válida y la evaluación `@ratings_to_show.include?(rating)` sea segura en la vista. Esto permite que, al presionar el botón "Refresh" sin seleccionar ninguna clasificación específica, se muestren todas las películas y se marquen todas las casillas de verificación por defecto.

Hasta el momento, hemos observado que la aplicación no implementa correctamente la funcionalidad de filtrado; aunque los botones de clasificación están presentes, no tienen un impacto real. Para corregir esto, se han realizado modificaciones sustanciales tanto en la clase controladora como en el modelo movie.rb. A continuación, se detallan los cambios realizados para abordar esta situación.

```ruby
# app/controllers/movies_controller.rb
def index
  # Obtener todas las películas o filtrar por calificaciones seleccionadas
  @movies = params[:ratings] ? Movie.with_ratings(params[:ratings].keys) : Movie.all

  # Configurar las clasificaciones seleccionadas para que las casillas de verificación se muestren como marcadas
  @ratings_to_show = params[:ratings]&.keys

  # Obtener todas las clasificaciones posibles para construir las casillas de verificación
  @all_ratings = Movie.all_ratings
end 
```

1. `@movies = params[:ratings] ? Movie.with_ratings(params[:ratings].keys) : Movie.all`: Aquí se determina si el usuario ha seleccionado alguna clasificación utilizando las casillas de verificación. Si se han seleccionado clasificaciones, se filtran las películas usando el método `with_ratings` del modelo `Movie`; de lo contrario, se obtienen todas las películas.

2. `@ratings_to_show = params[:ratings]&.keys`: Esta línea configura las clasificaciones seleccionadas para que las casillas de verificación se muestren como marcadas. Se utiliza el operador `&.` para manejar el caso en que `params[:ratings]` es `nil`.

3. `@all_ratings = Movie.all_ratings`: Se obtienen todas las clasificaciones posibles para construir las casillas de verificación en el formulario.

```ruby
# app/models/movie.rb
class Movie < ActiveRecord::Base
  
  def self.with_ratings(ratings_list)
    return all if ratings_list.nil? || ratings_list.empty?

    where(rating: ratings_list)
  end

  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R']
  end
end
```

1. `self.with_ratings(ratings_list)`: Este método de clase en el modelo `Movie` recibe una lista de clasificaciones y devuelve una relación ActiveRecord que contiene las películas cuyas clasificaciones coinciden con las clasificaciones de la lista. Si la lista es `nil` o está vacía, se devuelven todas las películas.

2. `self.all_ratings`: Este método de clase devuelve un array con todas las clasificaciones posibles ('G', 'PG', 'PG-13', 'R').

## Parte 2: Ordenar la lista de películas

Antes de comenzar, tenemos que trabajar en nuestra rama. Para esto vamos a crear una rama llamada `Parte02-Franklin`, y nos moveremos a esta rama usando el comando `git checkout Parte02-Franklin`.

![f4](img/f4.png)

Ahora si comenzamos a trabajar, ***Que se busca?*** Se busca habilitar la ordenación de la tabla a través de enlaces clicables en los encabezados de las columnas `Movie Title` y `Release Date`. Al hacer clic en un encabezado, la lista debería recargarse y ordenarse en función de la columna seleccionada. Por ejemplo, al hacer clic en "Release  Date", las películas deberían mostrarse con las más antiguas primero. Además, se resalta visualmente el encabezado de la columna seleccionada. 

Para implementar esto, se emplean enlaces HTML con la ayuda de la función `link_to`. Cada enlace apunta a la ruta RESTful correspondiente para recuperar la lista de películas ordenada. Se asignan identificadores únicos (IDs) a los enlaces para `title` y `release_date` para facilitar la manipulación del Modelo de objecto de documento (Document Object Model (**DOM**)). También se aplican clases CSS, como **"hilite"** y una clase de **color de Bootstrap**, para destacar el encabezado seleccionado.
~~~ruby
## Realizamos este cambio para darle estilo a nuestros encabezados
 th.hilite {
    background-color: #ffc107; /* Amarillo anaranjado de Bootstrap */
  }
~~~

~~~erb
# Realizamos este cambio en index.html.erb
<table class="table table-striped col-md-12" id="movies">
  <thead>
    <tr>
      <th class="<%= 'hilite' if @order_column == 'title' %>">
        <%= link_to "Movie Title", movies_path(order: { column: 'title', direction: 'asc' }) %>
      </th>
      <th class="<%= 'hilite' if @order_column == 'rating' %>">
        <%= link_to "Rating", movies_path(order: { column: 'rating', direction: 'asc' }) %>
      </th>
      <th class="<%= 'hilite' if @order_column == 'release_date' %>">
        <%= link_to "Release Date", movies_path(order: { column: 'release_date', direction: 'asc' }) %>
      </th>
      <th>More Info</th>
    </tr>
  </thead>
~~~

y finalmente editamos nuestro controlador de la siguiente manera. Este código carga todas las películas y las ordena según las especificaciones proporcionadas en los parámetros de la solicitud, si los hay. 

~~~ruby
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
	
    if params[:order].present?
      @order_column = params[:order][:column]
      @order_direction = params[:order][:direction]
      @movies = @movies.order("#{@order_column} #{@order_direction}")
    end
  end

end
~~~

Se manda a ejecutar el servidor,

![f0](img/f0.png)

Ahora podemos observar en el localhost lo siguiente.

![f1](img/f1.png)

Ahora debemos recordar tanto el filtro de clasificación como el ordenamiento de los encabezados. Para esto vamos hacer unos cambios en el `index.html.erb`. Vamos a modificar la llamada a `movies_path` para incluir informacion sobre las calificaciones seleccionadas.

~~~erb
<thead>
  <tr>
    <th class="<%= 'hilite' if @order_column == 'title' %>">
      <%= link_to "Movie Title", movies_path(order: { column: 'title', direction: 'asc' }, ratings: @ratings_to_show) %>
    </th>
    <th class="<%= 'hilite' if @order_column == 'rating' %>">
      <%= link_to "Rating", movies_path(order: { column: 'rating', direction: 'asc' }, ratings: @ratings_to_show) %>
    </th>
    <th class="<%= 'hilite' if @order_column == 'release_date' %>">
      <%= link_to "Release Date", movies_path(order: { column: 'release_date', direction: 'asc' }, ratings: @ratings_to_show) %>
    </th>
    <th>More Info</th>
  </tr>
</thead>
~~~

Luego vamos a editar el controlador, ahora primero vamos obtener todas las peliculas que se asignaran a `@movies`, para luego configurar las variables relacionadas con las clasificaciones y ordenamiento. Ya despues, si se proporcionan clasificaciones `(params[:ratings].present?)`, filtra las películas usando el método `with_ratings`. Finalmente, si se proporciona un orden `(params[:order].present?)`, ordena las películas en función de los parámetros de orden recibidos.

~~~ruby
  def index
    # Obtener todas las películas o filtrar por calificaciones seleccionadas
    @movies = Movie.all

    # Configurar las clasificaciones seleccionadas para que las casillas de verificación se muestren como marcadas
    @ratings_to_show = params[:ratings] || []

    # Obtener todas las clasificaciones posibles para construir las casillas de verificación
    @all_ratings = Movie.all_ratings

    # Verifica si se proporciona un orden y configura las variables de control
    if params[:order].present?
      @order_column = params[:order][:column]
      @order_direction = params[:order][:direction]
      @movies = @movies.order("#{@order_column} #{@order_direction}")
    end

    # Filtramos las películas por clasificaciones seleccionadas
    if params[:ratings].present?
      selected_ratings = params[:ratings].keys
      @movies = @movies.with_ratings(selected_ratings)
    end
  end
~~~
Finalizando esta seccion, podemos observar que si recuerda ahora el orden de encabezado y la clasificacion. 

![f2](img/f2.png)

Durante este apartado hemos realizado varios `commits` que se pueden visualizar en el github compartido, pero recordemos que estamos en una rama llamada `Parte02-Franklin`. Para poder actualizar la rama `main` tenemos que realizar un `merge`.
Nota: Tenemos que encontrarnos en la rama `main`, y desde ahi realizar el `merge`.

![f3](img/f3.png)

## Parte 3: Recuerda la configuración de clasificación y filtrado

Ahora tenemos el problema que cuando por ejemplo ingresamos a ver los detalles de una pelicula, este no se guarda al regresar a la vista `index`

### Pregunta: ¿Por qué se "olvida" la configuración de clasificación/filtrado de casillas de verificación cuando navegas a la página Movie Details y luego hace clic en Back to List button?

La vista de detalles de las películas y la vista de lista de películas operan en contextos separados y no comparten directamente el estado entre sí.

Cuando navegas a la página `show`, la información específica de esa película esté siendo cargada y la configuración de filtrado está siendo guardada persistentemente entre las diferentes vistas.

Ejemplo:

Escogemos nuestro filtro:

![a1](img/a1.PNG)

Ingresamos a ver el detalle de una película:

![a2](img/a2.PNG)

Y volvemos a la lista de películas:

![a3](img/a3.PNG)

Podemos observar que la lista volvió a su estaado base.

Ahora usaremos el concepto de `cookie`, con el hash `session[]`, al cual le pasaremos los parametros `ratings` y `order`.

En el siguiente fragmento de codigo dentro de la función `index` del controlador `movies_controller`:

~~~ruby
  def index
    # Obtener todas las películas o filtrar por calificaciones seleccionadas
    @movies = Movie.all

    # Configurar las clasificaciones seleccionadas para que las casillas de verificación se muestren como marcadas
    @ratings_to_show = params[:ratings] || session[:ratings] || []

    # Obtenemos todas las clasificaciones posibles para construir las casillas de verificación
    @all_ratings = Movie.all_ratings

    # Verifica si queremos ver sin restricciones
    if params[:order].nil? && params[:ratings].nil?
      session[:ratings] = nil
      session[:order] = nil
    end

    # Verifica si se proporciona un orden y configura las variables de control
    if params[:order].nil? && !session[:order].nil?
        params[:order] = session[:order]
    elsif !params[:order].nil?
      @order_column = params[:order][:column]
      @order_direction = params[:order][:direction]
      @movies = @movies.order("#{@order_column} #{@order_direction}")
      session[:order] = params[:order]
    end
    
    # Filtramos las películas por clasificaciones seleccionadas
    if params[:ratings].nil? && !session[:ratings].nil?
        params[:ratings] = session[:ratings]
    elsif !params[:ratings].nil?
      selected_ratings = params[:ratings].keys
      @movies = @movies.with_ratings(selected_ratings)
      session[:ratings] = params[:ratings]
    end
  end
~~~

Podemos observar como es que, en caso no hayamos escogido una opción de filtrado, nuestra `cookie` vuelve a su estado base:

~~~ruby
  if params[:order].nil? && params[:ratings].nil?
      session[:ratings] = nil
      session[:order] = nil
    end
~~~

En caso de que no hayamos escogido nada, porque vengamos de la vista de detalles de una pelicula, obtenemos la información de la `cookie`:

~~~ruby
  if params[:order].nil? && !session[:order].nil?
        params[:order] = session[:order]
~~~
En caso hubieramos escogido una clasificación, la cookie se actualiza:

~~~ruby
    elsif !params[:order].nil?
      @order_column = params[:order][:column]
      @order_direction = params[:order][:direction]
      @movies = @movies.order("#{@order_column} #{@order_direction}")
      session[:order] = params[:order]
    end
~~~

Analogamente con el ordenamiento:

~~~ruby
    if params[:ratings].nil? && !session[:ratings].nil?
        params[:ratings] = session[:ratings]
    elsif !params[:ratings].nil?
      selected_ratings = params[:ratings].keys
      @movies = @movies.with_ratings(selected_ratings)
      session[:ratings] = params[:ratings]
    end
~~~

Y ahora podemos ver el correcto funcionamiento del guardado de información persistente:

Escogemos nuestro filtro:

![a4](img/a4.PNG)

Ingresamos a ver el detalle de una película:

![a5](img/a5.PNG)

Y volvemos a la lista con nuetra opción anterior recordada correctamente: 

![a6](img/a6.PNG)