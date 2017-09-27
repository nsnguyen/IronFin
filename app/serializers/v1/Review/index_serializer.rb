# frozen_string_literal: true

module V1
  module Review
    class IndexSerializer

      def self.format_json(reviews)
        reviews.map do |review|
          {
              id: review['id'],
              name: review['name'],
              time: review['time'],
              rating: review['rating'],
              comment: review['comment']
          }
        end
      end
    end
  end
end