# frozen_string_literal: true

module V1
  class ActorsController < ::V1::ApiController
    def index
      # result = ActorServices::Index.new.run
      # render json: result

      result = Actor.first(1)
      render json: result

    end
  end
end

