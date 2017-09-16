# frozen_string_literal: true

module V1
  module Review
    class IndexSerializer

      def self.format_json(reviews)
        reviews.map do |review|
          {
              firstName: actor['first'],
              lastName: actor['last'],
              gender: actor['sex'],
              dateOfBirth: actor['dob'],
              dateOfDeath: actor['dod'],
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