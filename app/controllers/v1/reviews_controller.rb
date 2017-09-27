# frozen_string_literal: true

module V1
  class ReviewsController < ::V1::ApiController
    def index

      # definitely need some kind of validations..

      # result = ActorServices::Index.new(reviewer_name: params[:name],
      #                                   time_of_review: params[:time],
      #                                   movie_id: params[:mid],
      #                                   reviewers_rating_of_movie: params[:rating],
      #                                   comments_about_movie: params[:comment]).run
      render json: []

    end
  end
end

