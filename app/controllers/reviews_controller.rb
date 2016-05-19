class ReviewsController < ApplicationController
 before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
    @actors = Review.where(movie_id: @movie)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create!(review_params)
      redirect_to (review_path(@review))
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
    redirect_to review_path
  end

  private
  def review_params
    params.require(:review).permit(:string, :user_id, movie_ids: [])
  end

  def set_review
     @review = Review.find(params[:id])
  end

end
