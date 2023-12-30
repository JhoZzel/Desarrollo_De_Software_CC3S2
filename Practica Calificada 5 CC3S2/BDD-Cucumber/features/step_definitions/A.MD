Entiendo, proporcionaré los cambios necesarios en el archivo `movie_steps.rb` para cada pregunta:

```ruby
# features/step_definitions/movie_steps.rb

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie) # Use ActiveRecord to add movies to the database
  end
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # Split the rating_list into individual ratings
  ratings = rating_list.split(', ')

  # Check or uncheck each checkbox based on the input
  ratings.each do |rating|
    if uncheck.nil?
      check("ratings_#{rating}")
    else
      uncheck("ratings_#{rating}")
    end
  end
end

Then /^I should see the following movies: (.*)$/ do |movie_list|
  movies = movie_list.split(', ')
  movies.each do |movie|
    # Use Capybara's page to check if each movie is visible on the page
    expect(page).to have_content(movie)
  end
end

Then /I should see all the movies/ do
  # Count the number of rows in the movie table and compare it with the number of seed movies
  expect(page.all('table#movies tbody tr').count).to eq Movie.count
end
```

Ahora, una breve descripción de los cambios realizados para cada pregunta:

1. **Pregunta 1):**
   - Añadí código para crear las películas en la base de datos utilizando ActiveRecord en lugar de usar la marca "pending".

2. **Pregunta 2):**
   - Modifiqué la definición de paso para manejar la verificación o desmarcación de varias clasificaciones. Ahora, utiliza el método `check` o `uncheck` de Capybara según la acción especificada.

3. **Pregunta 3):**
   - Creé una nueva definición de paso que verifica la presencia de cada película en la lista. Utiliza Capybara para verificar si cada película está presente en la página.

4. **Pregunta 4):**
   - Añadí una definición de paso que verifica si se muestran todas las películas en la tabla. Utiliza el conteo de filas en la tabla HTML y compáralo con el número total de películas en la base de datos.

5. **Pregunta 5):**
   - Utilicé las nuevas definiciones de pasos creadas en las respuestas anteriores para completar el escenario con todas las calificaciones seleccionadas.

Estos cambios deberían ayudarte a completar con éxito los escenarios en `filter_movie_list.feature` y `sort_movie_list.feature`. Recuerda ejecutar tus pruebas Cucumber después de realizar estos cambios para asegurarte de que todo esté funcionando como se espera.