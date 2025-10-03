class MoviesController < ApplicationController
  def index
    if params[:filter] == "read"
      @movies = Movie.read
    elsif params[:filter] == "unread"
      @movies = Movie.unread
    else
      @movies = Movie.all
    end
  end
  def show
    @movie = Movie.find(params[:id])
  end

  def create
    movie =  Movie.new(movie_params)
    if movie.save
      redirect_to movies_path
    else
      flash[:error] = "Failed to create movie. Please ensure all fields are filled out."
      redirect_to movies_path
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update(update_movie_params)
      redirect_to movies_path
    else
      flash[:error] = "Failed to update movie. Please ensure all fields are filled out"
      redirect_to movies_path
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    if movie.destroy
    redirect_to movies_path
    else
      flash[:error] = "Failed to delete movie."
      redirect_to movies_path
    end
  end

  private

  def movie_params
    params.permit(:title, :year)
  end
  def update_movie_params
    params.require(:movie).permit(:title, :year, :read)
  end
end