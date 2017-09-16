# frozen_string_literal: true

module V1
  class ActorsController < ::V1::ApiController
    def index

      # definitely need some kind of validations..

      result = ActorServices::Index.new(first_name: params[:first],
                                        last_name: params[:last],
                                        sex: params[:sex],
                                        date_of_birth: params[:dob],
                                        date_of_death: params[:dod]).run

      render json: V1::Actor::IndexSerializer.format_json(result)

    end
  end
end

