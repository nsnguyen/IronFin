module DirectorServices
  class FillMovies

    attr_accessor :director_hashes, :director_ids

    def initialize(director_hashes, director_ids)
      self.director_hashes = director_hashes
      self.director_ids = director_ids
    end

    def run
      return nil unless director_hashes.any?

      directors_dict = build_directors_dictionary

      director_hashes.each do |director_hash|
        did = director_hash['id']
        director_hash['movies_directed'] = directors_dict[did] || []
      end
    end

    # This is to build the query dictionary. {key, value}
    def build_directors_dictionary
      dict = {}

      movies.each do |movie|
        key = movie['did']

        # if key does not exist, set to empty array.
        dict[key] ||= []

        # push to that key.
        dict[key].push as_hashes(movie)
      end

      dict
    end

    def as_hashes(movie)
      {
          'did' => movie['did'],
          'mid' => movie['mid'],
          'title' => movie['title'],
          'year' => movie['year'],
          'rating' => movie['rating'],
          'company' => movie['company']
      }
    end

    # actor_ids is an array of actor_id. This is one time query call.
    def query
      query = <<~HEREDOC
        SELECT *
        FROM movie_directors md
        INNER JOIN movies m
        ON md.mid = m.id
        WHERE md.did in (?)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, director_ids])
    end

    def movies
      @movies ||= ActiveRecord::Base.connection.execute(query)
    end
  end
end