# frozen_string_literal: true

module V1
  module Actor
    class IndexSerializer
      def self.format_json(actors)
        actors.map do |actor|
          {
              firstName: actor['first'],
              lastName: actor['last'],
              gender: actor['sex'],
              dateOfBirth: actor['dob'].present? ? Date.parse(actor['dob'], '%Y/%m/%d') : nil,
              dateOfDeath: actor['dod'].present? ? Date.parse(actor['dod'], '%Y/%m/%d') : nil,
              moviesActedIn: format_movies_json(actor['movies_acted_in']),
          }
        end
      end

      def self.format_movies_json(movies)
        movies.map do |movie|
          {
              actorRole: movie['role'],
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