# frozen_string_literal: true

module V1
  class DirectorsController < ::V1::ApiController
    def index
      if validate_params.success?
        result = DirectorServices::Index.new(first_name: params[:first],
                                             last_name: params[:last],
                                             date_of_birth: params[:dob],
                                             date_of_death: params[:dod]).run
        render json: V1::Director::IndexSerializer.format_json(result)
      else
        render json: validate_params.messages(full: true)
      end
    end

    private

    def validate_params
      schema = Dry::Validation.Schema do
        optional(:first).filled(:str?, format?: Regexp.new('^[a-zA-Z-. ]*$'))
        optional(:last).filled(:str?, format?: Regexp.new('^[a-zA-Z-. ]*$'))
        optional(:dob).filled(:str?, format?: Regexp.new('^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$'))
        optional(:dod).filled(:str?, format?: Regexp.new('^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$'))
      end

      schema.call(params)
    end
  end
end

