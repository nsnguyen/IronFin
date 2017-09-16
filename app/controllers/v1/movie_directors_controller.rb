# frozen_string_literal: true

module V1
  class MovieDirectorsController < ::V1::ApiController
    def index

      # definitely need some kind of validations..

      result = MovieDirectorServices::Index.new(movie_id: params[:mid],
                                        director_id: params[:did]).run
      render json: result


    end
  end
end

