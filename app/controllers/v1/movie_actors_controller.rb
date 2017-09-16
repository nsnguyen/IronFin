# frozen_string_literal: true

module V1
  class MovieActorsController < ::V1::ApiController
    def index

      # definitely need some kind of validations..

      result = MovieActorServices::Index.new(movie_id: params[:mid],
                                        actor_id: params[:aid],
                                        movie_role: params[:role]).run
      render json: result


    end
  end
end

