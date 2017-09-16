# frozen_string_literal: true

module V1
  module MovieGenre
    class IndexSerializer

      def self.format_json(movieGenres)
        movieGenres.map do |movieGenre|
          {
              movieID: movieGenre['mid'],
              movieGenre: movieGenre['genre']
          }
        end
      end
    end
  end
end