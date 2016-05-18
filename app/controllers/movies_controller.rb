class MoviesController < ApplicationController
 before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    # @actors = Review.where(movie_id: @movie)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create!(movie_params)
      redirect_to (movie_path(@movie))
  end

  def edit
  end

  def update
    @movie.update(movie_params)
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :summary, :youtubelink, :thumbnail, actor_ids: [])
  end

  def set_movie
     @movie = Movie.find(params[:id])
  end

end
