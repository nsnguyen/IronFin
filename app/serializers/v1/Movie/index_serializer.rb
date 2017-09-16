# frozen_string_literal: true

module V1
  module Movie
    class IndexSerializer

      def self.format_json(movies)
        movies.map do |movie|
          {
              movieTitle: movie['title'],
              movieReleaseYear: movie['year'],
              movieRating: movie['rating'],
              movieCompanyName: movie['company']
          }
        end
      end
    end
  end
end