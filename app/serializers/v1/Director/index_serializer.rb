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
              movieTitle: director['title'],
              movieYear: director['year'],
              movieRating: director['rating'],
              movieCompany: director['company']
          }
        end
      end
    end
  end
end