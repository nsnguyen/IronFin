class MovieDirectorsController < ApplicationController
  before_action :set_movie_director, only: [:show, :update, :destroy]

  # GET /movie_directors
  def index
    @movie_directors = MovieDirector.all

    render json: @movie_directors
  end

  # GET /movie_directors/1
  def show
    render json: @movie_director
  end

  # POST /movie_directors
  def create
    @movie_director = MovieDirector.new(movie_director_params)

    if @movie_director.save
      render json: @movie_director, status: :created, location: @movie_director
    else
      render json: @movie_director.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movie_directors/1
  def update
    if @movie_director.update(movie_director_params)
      render json: @movie_director
    else
      render json: @movie_director.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movie_directors/1
  def destroy
    @movie_director.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_director
      @movie_director = MovieDirector.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_director_params
      params.require(:movie_director).permit(:mid, :did)
    end
end
