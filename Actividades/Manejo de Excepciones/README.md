# Actividad: código limpio, manejo de excepciones, depuración
- Chavez Chico Joel Jhotan 2021005J
Pasos de la actividad:

# Primera Parte

1.- **Implementa un repositorio personal llamado CC3S2 y dentro construye una carpeta llamada CED y utiliza el siguiente tutorial.:  https://www.toptal.com/abap/clean-code-and-the-art-of-exception-handling en alguna de las actividades o evaluaciones realizadas en clase. ¿Que diferencias encuentras con lo indicado aquí https://codedamn.com/news/javascript/error-handling-debugging para Java Script?**

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

**Pregunta**:  Que diferencias encuentras con lo indicado aquí https://codedamn.com/news/javascript/error-handling-debugging para Java Script?

Las diferencias entre las prácticas de manejo de errores en Ruby on Rails y JavaScript son notables. En Ruby on Rails, se hace hincapié en la creación de una jerarquía de excepciones personalizada y en no rescatar más excepciones de las necesarias. Esto se refleja en el código, donde se utilizan estructuras como `rescue_from` para manejar excepciones específicas a nivel de controlador y se evita capturar excepciones genéricas innecesarias, siguiendo el principio de "No Rescatar Más Excepciones de las Necesarias".

En contraste, el artículo sobre JavaScript destaca el uso de bloques `try`, `catch`, y `finally` para manejar excepciones de manera más general. Se enfoca en la creación de mensajes de error significativos y en la validación de datos de entrada para evitar problemas. Mientras que en Rails se promueve la creación de clases de excepciones personalizadas, en JavaScript se resalta la extensión de la clase `Error` para crear tipos de errores personalizados. Aunque ambos enfoques comparten la importancia de escribir mensajes de error significativos, difieren en cómo estructuran la jerarquía de excepciones y manejan los errores de manera más generalizada.

# Segunda Parte

2.- **Luego lee y replica el tutorial https://www.toptal.com/ruby/how-to-set-up-a-microservices-architecture e indica cuales son las principales diferencias en utilizar una arquitectura orientada  a Microservicios y la de Cliente-Servidor vista en clase con Rails.**

**Respuesta**: A continuación se menciona algunas diferencias más resaltantes:

1. **Separación de responsabilidades:**
- En una arquitectura de microservicios, los servicios están diseñados para ser independientes y gestionar funciones específicas del dominio. Cada microservicio tiene su propia lógica y datos mientrás que en una arquitectura cliente-servidor típica con Rails, la lógica del servidor (backend) y la interfaz de usuario del cliente (frontend) están más estrechamente vinculadas. Rails sigue un enfoque monolítico en el que el backend maneja la mayoría de las funciones y la interfaz de usuario interactúa con él.

2. **Flexibilidad tecnológica:**
- Cada microservicio puede utilizar tecnologías diferentes según los requisitos específicos del servicio. Esto permite la elección de la mejor tecnología para cada función. En una aplicación como Rails, todas las partes de la aplicación comparten la misma tecnología y base de código.

3. **Escalabilidad y tolerancia a fallos:**
- La arquitectura de microservicios facilita la escalabilidad individual de servicios específicos en función de la carga. Además, la tolerancia a fallos se puede gestionar de manera más granular, pero para una app en rails puede requerir escalar toda la aplicación, incluso si solo una parte experimenta una carga pesada. La tolerancia a fallos está más centralizada.

4. **Comunicación entre servicios:**
- En el tutorial, se utiliza ZeroMQ para la comunicación entre microservicios. La comunicación se gestiona a través de un broker, lo que permite la independencia entre servicios. La comunicación en la otra arquitectura suele realizarse a través de solicitudes HTTP directas entre el cliente y el servidor monolítico.

5. **Despliegue independiente:**
- Cada microservicio se puede implementar y actualizar de forma independiente, lo que facilita la implementación continua y la entrega continua, mientrás que en la otra, las actualizaciones afectan a toda la aplicación, lo que puede requerir un tiempo de inactividad planificado.


En conclusión, la elección entre una arquitectura orientada a microservicios y el enfoque cliente-servidor en Rails no puede reducirse a una afirmación de superioridad general. Ambos paradigmas presentan sus propias fortalezas y áreas de especialización. La arquitectura orientada a microservicios brinda mayor escalabilidad y flexibilidad, ideal para sistemas complejos y distribuidos. Por otro lado, el enfoque cliente-servidor de Rails ofrece simplicidad y eficiencia en aplicaciones más monolíticas. La elección depende en gran medida de los requisitos específicos del proyecto y las metas de desarrollo. Optar por uno sobre el otro debería basarse en una evaluación cuidadosa de los objetivos, la complejidad del sistema y las necesidades de escalabilidad para garantizar un diseño arquitectónico coherente y efectivo.