# frozen_string_literal: true

module V1
  module Director
    class IndexSerializer
      def self.format_json(directors)
        directors.map do |director|
          {
              firstName: director['first'],
              lastName: director['last'],
              dateOfBirth: director['dob'].present? ? Date.parse(director['dob'], '%Y/%m/%d') : nil,
              dateOfDeath: director['dod'].present? ? Date.parse(director['dod'], '%Y/%m/%d') : nil,
              moviesDirected: format_movies_json(director['movies_directed'])
          }
        end
      end

      def self.format_movies_json(movies)
        movies.map do |movie|
          {
              movieTitle: movie['title'],
              movieYear: movie['year'],
              movieRating: movie['rating'],
              movieCompany: movie['company']
          }
        end
      end
    end
  end
end