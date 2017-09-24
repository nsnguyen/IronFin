module ActorServices
  class FillMovies

    attr_accessor :actor_hashes, :actor_ids

    def initialize(actor_hashes, actor_ids)
      self.actor_hashes = actor_hashes
      self.actor_ids = actor_ids
    end

    def run
      return nil unless actor_hashes.any?

      actors_dict = build_actors_dictionary

      actor_hashes.each do |actor_hash|
        aid = actor_hash['id']
        actor_hash['movies_acted_in'] = actors_dict[aid] || []
      end
    end

    # This is to build the query dictionary. {key, value}
    def build_actors_dictionary
      dict = {}

      movies.each do |movie|
        key = movie['aid']

        # if key does not exist, set to empty array.
        dict[key] ||= []

        # push to that key.
        dict[key].push as_hashes(movie)
      end

      dict
    end

    def as_hashes(movie)
      {
          'aid' => movie['aid'],
          'mid' => movie['mid'],
          'role' => movie['role'],
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
        FROM movie_actors am
        INNER JOIN movies m
        ON am.mid = m.id
        WHERE am.aid in (?)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, actor_ids])
    end

    def movies
      @movies ||= ActiveRecord::Base.connection.execute(query)
    end
  end
end