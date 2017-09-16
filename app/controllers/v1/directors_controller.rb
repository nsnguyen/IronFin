# frozen_string_literal: true

module V1
  class DirectorsController < ::V1::ApiController
    def index

      # definitely need some kind of validations..

      result = DirectorServices::Index.new(first_name: params[:first],
                                        last_name: params[:last],
                                        date_of_birth: params[:dob],
                                        date_of_death: params[:dod]).run
      render json: result


    end
  end
end

