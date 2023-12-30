class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    id = params[:id]
    @movie = Movie.find_movie(id)
    logger.debug("Detalles acerca de la pelicula: #{movie.inspect}")
    # will render render app/views/movies/show.html.haml by default
  end

  def new
    @movie = Movie.new
  end 

  def create
    @movie = Movie.create(movie_params)
    redirect_to movies_path, notice: "#{@movie.title} created."
  rescue ActiveRecord::RecordInvalid
    handle_validation_error(@movie)
  end

  
  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie), notice: "#{@movie.title} updated."
    else
      handle_validation_error(@movie)
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, :notice => "#{@movie.title} deleted."
  end
  private
  
  def movie_params
    params.require(:movie)
    params[:movie].permit(:title,:rating,:release_date)
  end
  
  private 

  def handle_application_error(exception)
    logger.error("Excepción encontrada: #{exception.message}")
    flash[:alert] = "Error: #{exception.message}"
    redirect_to root_path
  end

end
