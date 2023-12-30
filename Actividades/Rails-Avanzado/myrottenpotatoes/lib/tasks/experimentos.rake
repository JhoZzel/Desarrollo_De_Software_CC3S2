# lib/tasks/experimentos.rake

task :mi_experimento do
    require 'trace_location'
  
    TraceLocation.show do
      # Tu código de experimentación aquí
    end
  end