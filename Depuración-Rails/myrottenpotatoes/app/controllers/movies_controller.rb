class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  def show
    id = params[:id] # retrieve movie ID from URI route
    #raise.params.inspect
    
    @movie = Movie.find(id) # look up movie by unique ID
    logger.debug("movie.inspect() :  #{@movie.inspect}")
    # Modificacion
    logger.debug("Nueva linea 1 añadida en la RAMA TEST")
    logger.debug("Nueva linea 2 añadida en la RAMA TEST")
    logger.debug("Nueva linea 3 añadida en la RAMA TEST")

    

    logger.debug("Nueva linea ingresada el rama MAIN")

    rescue => excep
      logger.debug("exception :  #{excep.message}")
  end
  def new
    @movie = Movie.new
  end 
  def create
    if (@movie = Movie.create(movie_params))
      redirect_to movies_path, :notice => "#{@movie.title} created."
    else
      flash[:alert] = "Movie #{@movie.title} could not be created: " +
        @movie.errors.full_messages.join(",")
      render 'new'
    end
  end
  def edit
    @movie = Movie.find params[:id]
  end
  def update
    @movie = Movie.find params[:id]
    if (@movie.update_attributes(movie_params))
      redirect_to movie_path(@movie), :notice => "#{@movie.title} updated."
    else
      flash[:alert] = "#{@movie.title} could not be updated: " +
        @movie.errors.full_messages.join(",")
      render 'edit'
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
end

