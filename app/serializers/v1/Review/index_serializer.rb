# frozen_string_literal: true

module V1
  module Review
    class IndexSerializer

      def self.format_json(reviews)
        reviews.map do |review|
          {
              reviewerName: review['name'],
              timeOfReview: review['time'],
              movieId: review['mid'],
              reviewersRatingOfMovie: review['rating'],
              commentsAboutMovie: review['comment']
          }
        end
      end
    end
  end