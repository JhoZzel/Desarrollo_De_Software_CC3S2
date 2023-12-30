# middleware_experiment.rb
require 'trace_lcation'

# Definir un middleware simple
class SimpleMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    puts 'Before middleware'
    result = @app.call(env)
    puts 'After middleware'
    result
  end
end

# Rack application básica
app = ->(env) { [200, { 'Content-Type' => 'text/plain' }, ['Hello, Rack!']] }

# Encadenar el middleware y la aplicación Rack
stack = SimpleMiddleware.new(app)

# Ejecutar la aplicación
TraceLocation.watch('middleware_experiment') do
  stack.call({})
end
o
