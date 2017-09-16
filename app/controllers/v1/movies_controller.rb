# frozen_string_literal: true

module V1
  class MoviesController < ::V1::ApiController
    def index

      # definitely need some kind of validations..

      result = MovieServices::Index.new(movie_title: params[:title],
                                        movie_release_year: params[:year],
                                        movie_rating: params[:rating],
                                        company_name: params[:company]).run
      render json: result


    end
  end
end

