class MoviesController < ApplicationController
  def index
  	@movies = Movie.released
  end

  def show
   	@movie = Movie.find(params[:id])
    @reviews = @movie.reviews.order(created_at: :desc)
    @review = @movie.reviews.new
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def update
  	@movie = Movie.find(params[:id])
  	if @movie.update(movie_params)
  	  redirect_to @movie, notice: 'Movie Sucessfully Updated!'
    else
      render :edit
    end
  end

  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.new(movie_params)
  	if @movie.save
     	redirect_to @movie, notice: 'Movie Sucessfully Created!'
    else
      render :new
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path, notice: 'Movie Sucessfully Deleted!'
  end

private
  def movie_params
 	params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image)
  end
end
