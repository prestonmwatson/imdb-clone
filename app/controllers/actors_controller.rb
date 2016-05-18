class ActorsController < ApplicationController
before_action :set_actor, only: [:show, :edit, :update, :destroy]

  def index
    @actors = Actor.all
  end

  def show
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.create!(actor_params)
      redirect_to (actor_path(@actor))
  end

  def edit
  end

  def update
    @actor.update(actor_params)
    redirect_to actor_path(@actor)
  end

  def destroy
    @actor.destroy
    redirect_to actors_path
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :year_of_birth, :thumbnail)
  end

  def set_actor
    @actor = Actor.find(params[:id])
  end
end
