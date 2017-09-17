# frozen_string_literal: true

module V1
  class ActorsController < ::V1::ApiController
    def index

      schema = Dry::Validation.Schema do
        required(:first).filled(:str?, format?: Regexp.new('^[a-zA-Z-. ]*$'))
        required(:last).filled(:str?)
      end

      params_check = schema.call(params)

      if params_check.failure?
        render json: params_check.messages(full: true)

      else
        result = ActorServices::Index.new(first_name: params[:first],
                                          last_name: params[:last],
                                          sex: params[:sex],
                                          date_of_birth: params[:dob],
                                          date_of_death: params[:dod]).run

        render json: V1::Actor::IndexSerializer.format_json(result)

      end







    end
  end
end

