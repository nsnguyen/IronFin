# frozen_string_literal: true

module V1
  class MovieGenresController < ::V1::ApiController
    def index

      # definitely need some kind of validations..

      result = MovieGenreServices::Index.new(movie_id: params[:mid],
                                        movie_genre: params[:genre]).run
      render json: result


    end
  end
end

