class MovieActorsController < ApplicationController
  before_action :set_movie_actor, only: [:show, :update, :destroy]

  # GET /movie_actors
  def index
    @movie_actors = MovieActor.all

    render json: @movie_actors
  end

  # GET /movie_actors/1
  def show
    render json: @movie_actor
  end

  # POST /movie_actors
  def create
    @movie_actor = MovieActor.new(movie_actor_params)

    if @movie_actor.save
      render json: @movie_actor, status: :created, location: @movie_actor
    else
      render json: @movie_actor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movie_actors/1
  def update
    if @movie_actor.update(movie_actor_params)
      render json: @movie_actor
    else
      render json: @movie_actor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movie_actors/1
  def destroy
    @movie_actor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_actor
      @movie_actor = MovieActor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_actor_params
      params.require(:movie_actor).permit(:mid, :aid, :role)
    end
end
