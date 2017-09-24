module MovieServices
  class FillGenres

    attr_accessor :movie_hashes, :movie_ids

    def initialize(movie_hashes, movie_ids)
      self.movie_hashes = movie_hashes
      self.movie_ids = movie_ids
    end

    def run
      return nil unless movie_hashes.any?

      genres_dict = build_genres_dictionary

      movie_hashes.each do |movie_hash|
        mid = movie_hash['id']
        movie_hash['genre'] = genres_dict[mid] || []
      end
    end

    # This is to build the query dictionary. {key, value}
    def build_genres_dictionary
      dict = {}

      genres.each do |genre|
        key = genre['mid']

        # if key does not exist, set to empty array.
        dict[key] ||= []

        # push to that key.
        dict[key].push as_hashes(genre)
      end

      dict
    end

    def as_hashes(genre)
      {
          'mid' => genre['mid'],
          'genre' => genre['genre']
      }
    end

    # movie_ids is an array of movie_id. This is one time query call.
    def query
      query = <<~HEREDOC
        SELECT *
        FROM movie_genres mg
        WHERE mg.mid in (?)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, movie_ids])
    end

    def genres
      @genres ||= ActiveRecord::Base.connection.execute(query)
    end
  end
end