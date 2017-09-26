module DirectorServices
  class Index
    attr_accessor :first_name , :last_name, :date_of_birth, :date_of_death, :movies_directed

    def initialize(first_name: nil, last_name: nil, date_of_birth: nil, date_of_death: nil, movies_directed: nil)
      self.first_name = first_name
      self.last_name = last_name
      self.date_of_birth = date_of_birth
      self.date_of_death = date_of_death
      self.movies_directed = movies_directed

    end

    def run
      # get initial directors data in PDG
      directors = run_query

      # build directors_ids array so it can pass into second SQL query to search for genres.
      director_ids = director_ids(directors)

      # convert to hashes so we can add genres in easily.
      director_hashes = as_hashes(directors)

      # pass directors_hashes as reference. Fill Movies class will append directors genres.
      DirectorServices::FillMovies.new(director_hashes, director_ids).run

      director_hashes
    end

    def director_ids(directors)
      # this is to put actor_ids into an array
      directors.pluck('id')
    end

    def run_query
      @run_query ||= ActiveRecord::Base.connection.execute(query)
    end

    def as_hashes(directors)
      directors.map do |director|
      {
          'id' => director['id'],
          'first' => director['first'],
          'last' => director['last'],
          'dob' => director['dob'],
          'dod' => director['dod'],
          'movies_directed' => []
      }
      end
    end

    # probably a good idea to use ActiveRecord but let's just do SQL query to show what we can do.
    def query
      query = <<~HEREDOC
        SELECT *
        FROM Directors d
        WHERE (LOWER(d.first) LIKE LOWER(?) OR LOWER(?) IS NULL)
        AND (LOWER(d.last) LIKE LOWER(?) OR LOWER(?) IS NULL)
        AND (d.dob = ? OR ? IS NULL)
        AND (d.dod = ? OR ? IS NULL)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, "%#{first_name}%", "%#{first_name}%", "%#{last_name}%", "%#{last_name}%", date_of_birth, date_of_birth, date_of_death, date_of_death])

    end
  end
end

