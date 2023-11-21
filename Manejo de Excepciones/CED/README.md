# Actividad: código limpio, manejo de excepciones, depuración
- Chavez Chico Joel Jhotan 2021005J
Pasos de la actividad:
1) **Implementa un repositorio personal llamado CC3S2 y dentro construye una carpeta llamada CED y utiliza el siguiente tutorial.:  https://www.toptal.com/abap/clean-code-and-the-art-of-exception-handling en alguna de las actividades o evaluaciones realizadas en clase. ¿Que diferencias encuentras con lo indicado aquí https://codedamn.com/news/javascript/error-handling-debugging para Java Script?**

Para este paso nos basaremos en la actividad `Depuración SaaS que usan Rails` que ya hemos realizado anteriormente, así que a partir de este vamos a seguir las recomendaciones que se menciona en el artículo para poder manejar un código limpio.

## Creación de una Jerarquía de Excepciones Personalizada

Vamos a realizar la creación de una jerarquía de excepciones personalizada para definir clases de excepciones específicas para la aplicación las cuales heredan de `StandardError` u otra clase base. Estas clases de excepciones nos permitirán organizar y manejar diferentes tipos de errores de manera más estructurada.

En `application_record.rb` hemos implementado una jerarquía de excepciones personalizada como se muestra a continuacuón:

```ruby
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  class ApplicationError < StandardError; end
  class ValidationError < ApplicationError; end
  class ResponseError < ApplicationError; end
end
```
Ahora bien, en el modelo `movie.rb` se utiliza la excepción `ValidationError` cuando se encuentra un error al intentar buscar una película por ID.

```ruby
class Movie < ApplicationRecord
  validates :title, presence: true
  validates :rating, inclusion: { in: %w(G PG PG-13 R) }

  def self.find_movie(id)
    begin
      find(id)
    rescue ActiveRecord::RecordNotFound
      raise ApplicationRecord::ValidationError, "Movie not found with ID: #{id}"
    end
  end
end
```

## Rescatar Excepciones Específicas

```ruby
class MoviesController < ApplicationController
  rescue_from ApplicationRecord::ApplicationError, with: :handle_application_error

  def show
    id = params[:id]
    @movie = Movie.find_movie(id)
    logger.debug("Detalles acerca de la pelicula: #{movie.inspect}")
    # will render render app/views/movies/show.html.haml by default
  end

  # ...
  # ...

  private

  def handle_application_error(exception)
    logger.error("Excepción encontrada: #{exception.message}")
    flash[:alert] = "Error: #{exception.message}"
    redirect_to root_path
  end
end
```

Se utiliza `rescue_from` en el controlador de películas (MoviesController) para manejar de manera centralizada todas las excepciones derivadas de `ApplicationError`. Esto significa que cualquier excepción específica de la aplicación que se derive de `ApplicationError` será capturada por el método `handle_application_error`, el cual se encargará de manejar estas excepciones específicas.

Por otro lado tenemos el método `show` el cual hace uso del método `find_movie` del modelo Movie, que a su vez maneja excepciones específicas como `ApplicationError` cuando no se encuentra la película.


## No Rescatar Más Excepciones de las Necesarias

El tutorial sigue la recomendación de manejar solo las excepciones necesarias, es decir en lugar de capturar excepciones genéricas, como podría ser el caso al usar `rescue => e`, el código maneja específicamente errores de validación cuando ocurren al actualizar una película. De este modo hemos modificado el método `update`, para que se actualize una película (@movie) con los parámetros proporcionados. Si la actualización es exitosa, se redirige a la página de detalles de la película con un aviso. Sin embargo, si hay errores de validación al actualizar la película, se llama al método `handle_validation_error`

```ruby
def update
  @movie = Movie.find(params[:id])

  if @movie.update_attributes(movie_params)
    redirect_to movie_path(@movie), notice: "#{@movie.title} updated."
  else
    handle_validation_error(@movie)
  end
end

private

def handle_validation_error(record)
  logger.error("Validation error: #{record.errors.full_messages.join(', ')}")
  flash[:alert] = "Validation error: #{record.errors.full_messages.join(', ')}"
  render 'edit'
end
```

## Resistir la Urgencia de Manejar Excepciones Inmediatamente
Para esta sección lo que se busca es manejar la excepción directamente en el lugar donde ocurre, se permite que la excepción `ActiveRecord::RecordInvalid` se propague hacia arriba. Esto ofrece la posibilidad de manejar las excepciones de manera más centralizada, posiblemente en un manejador global, y evita un manejo excesivo de excepciones en el código específico de la acción `create`. La propagación de la excepción también permite una mayor flexibilidad en el manejo de diferentes tipos de excepciones en niveles superiores del código.

```ruby
def create
  @movie = Movie.create(movie_params)
  redirect_to movies_path, notice: "#{@movie.title} created."
rescue ActiveRecord::RecordInvalid
  handle_validation_error(@movie)
end
```

## Loggear Todas las Excepciones

Por último el tutorial resalta el tener que asegurarnos de loggear todas y cada una de las excepciones, para nuestro caso lo hacemos de la siguiente forma:

```ruby
class ApplicationController < ActionController::Base
  rescue_from Exception, with: :handle_exception

  private

  def handle_exception(exception)
    logger.error("Unhandled exception: #{exception.message}")
    flash[:alert] = "An unexpected error occurred. Please try again later."
    redirect_to root_path
  end
end
```