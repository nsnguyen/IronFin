# frozen_string_literal: true

module V1
  class MoviesController < ::V1::ApiController
    def index

      if validate_params.success?
        result = MovieServices::Index.new(movie_title: params[:title],
                                          movie_release_year: params[:year],
                                          movie_rating: params[:rating],
                                          company_name: params[:company]).run
        render json: V1::Movie::IndexSerializer.format_json(result)
      else
        render json: validate_params.messages(full: true)
      end
    end

    private

    def validate_params
      schema = Dry::Validation.Schema do
        optional(:title).filled(:str?, format?: Regexp.new('^[a-zA-Z-. ]*$'))
        optional(:year).filled(:int?, gteq?: 0)
        optional(:rating).filled(:str?)
        optional(:company).filled(:str?)
      end

      schema.call(params)
    end

  end
end

