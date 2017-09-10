class MovieGenresController < ApplicationController
  before_action :set_movie_genre, only: [:show, :update, :destroy]

  # GET /movie_genres
  def index
    @movie_genres = MovieGenre.all

    render json: @movie_genres
  end

  # GET /movie_genres/1
  def show
    render json: @movie_genre
  end

  # POST /movie_genres
  def create
    @movie_genre = MovieGenre.new(movie_genre_params)

    if @movie_genre.save
      render json: @movie_genre, status: :created, location: @movie_genre
    else
      render json: @movie_genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movie_genres/1
  def update
    if @movie_genre.update(movie_genre_params)
      render json: @movie_genre
    else
      render json: @movie_genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movie_genres/1
  def destroy
    @movie_genre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_genre
      @movie_genre = MovieGenre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movie_genre_params
      params.require(:movie_genre).permit(:mid, :genre)
    end
end
