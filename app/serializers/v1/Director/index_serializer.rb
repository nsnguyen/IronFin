# frozen_string_literal: true

module V1
  module Director
    class IndexSerializer

      def self.format_json(directors)
        directors.map do |director|
          {
              firstName: director['first'],
              lastName: director['last'],
              dateOfBirth: director['dob'],
              dateOfDeath: director['dod']
          }
        end
      end
    end
  end
end