# frozen_string_literal: true

module V1
  module MovieActor
    class IndexSerializer

      def self.format_json(movieActors)
        movieActors.map do |movieActor|
          {
              movieID: actor['mid'],
              actorID: actor['aid'],
              movieRole: actor['role']
          }
        end
      end
    end
  end
end