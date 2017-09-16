# frozen_string_literal: true

module V1
  module MovieDirector
    class IndexSerializer

      def self.format_json(movieDirectors)
        movieDirectors.map do |movieDirector|
          {
              movieID: movieDirector['mid'],
              directorID: movieDirector['did']
          }
        end
      end
    end
  end
end