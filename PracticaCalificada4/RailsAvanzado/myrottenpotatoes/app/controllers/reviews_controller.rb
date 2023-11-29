class ReviewsController < ApplicationController
    before_filter :authenticate_user!
    before_action :set_review, only: [:edit, :update]
    
    def has_moviegoer_and_movie
        unless @current_user
          flash[:warning] = 'You must be logged in to create a review.'
          redirect_to login_path
        end
        unless (@movie = Movie.where(:id => params[:movie_id]))
          flash[:warning] = 'Review must be for an existing movie.'
          redirect_to movies_path
        end
    end
    
    public

    def new
      @review = @movie.reviews.build
    end
  
    def create
      @current_user.reviews << @movie.reviews.build(review_params)
      redirect_to movie_path(@movie)
    end
  
    def edit
      redirect_to root_path, alert: 'You are not authorized to edit this review.' unless current_user_can_edit?(@review)
    end
  
    def update
      redirect_to root_path, alert: 'You are not authorized to update this review.' unless current_user_can_edit?(@review)
  
      if @review.update(review_params)
        redirect_to movie_path(@movie), notice: 'Review updated.'
      else
        flash[:alert] = 'Review could not be updated: ' + @review.errors.full_messages.join(',')
        render 'edit'
      end
    end
  
    private
  
    def set_review
      @review = Review.find(params[:id])
      @movie = @review.movie
    end
  
    def current_user_can_edit?(review)
      current_user == review.moviegoer
    end
  
    def review_params
      params.require(:review).permit(:your, :review, :params)
    end
  end