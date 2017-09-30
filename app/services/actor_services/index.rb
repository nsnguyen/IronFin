# frozen_string_literal: true

module ActorServices
  class Index
    attr_accessor :first_name , :last_name, :sex, :date_of_birth, :date_of_death, :movies_acted_in, :show_movies

    def initialize(first_name: nil, last_name: nil, sex: nil, date_of_birth: nil, date_of_death: nil, movies_acted_in: nil, show_movies: nil)
      self.first_name = first_name
      self.last_name = last_name
      self.sex = sex
      self.date_of_birth = date_of_birth
      self.date_of_death = date_of_death
      self.movies_acted_in = movies_acted_in
      self.show_movies = show_movies

    end

    def run

      # get initial actors data in PDG
      actors = run_query

      if show_movies

        # build actors_ids array so it can pass into second SQL query to search for genres.
        actor_ids = actor_ids(actors)

        # convert to hashes so we can add genres in easily.
        actor_hashes = as_hashes(actors)

        # pass actors_hashes as reference. Fill Movies class will append actors genres.
        ActorServices::FillMovies.new(actor_hashes, actor_ids).run

        return actor_hashes
      end

      actors
    end

    def actor_ids(actors)
      # this is to put actor_ids into an array
      actors.pluck('id')
    end

    def run_query

      @run_query ||= ActiveRecord::Base.connection.execute(query)

    end

    def as_hashes(actors)
      actors.map do |actor|
      {
          'id' => actor['id'],
          'first' => actor['first'],
          'last' => actor['last'],
          'sex' => actor['sex'],
          'dob' => actor['dob'],
          'dod' => actor['dod'],
          'movies_acted_in' => []
      }
      end
    end

    # probably a good idea to use ActiveRecord but let's just do SQL query to show what we can do.
    def query
      query = <<~HEREDOC
        SELECT *
        FROM Actors a
        WHERE (LOWER(a.first) LIKE LOWER(?) OR LOWER(?) IS NULL)
        AND (LOWER(a.last) LIKE LOWER(?) OR LOWER(?) IS NULL)
        AND (LOWER(a.sex) = LOWER(?) OR LOWER(?) IS NULL)
        AND (a.dob = ? OR ? IS NULL)
        AND (a.dod = ? OR ? IS NULL)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, "%#{first_name}%", "%#{first_name}%", "%#{last_name}%", "%#{last_name}%", sex, sex, date_of_birth, date_of_birth, date_of_death, date_of_death])
    end
  end
end

