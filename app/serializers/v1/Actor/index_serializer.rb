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
              actorRole: actor['role'],
              movieTitle: actor['title'],
              movieYear: actor['year'],
              movieRating: actor['rating'],
              movieCompany: actor['company']
          }
        end
      end
    end
  end
end