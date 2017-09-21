module DirectorServices
  class Index
    attr_accessor :first_name , :last_name, :date_of_birth, :date_of_death

    def initialize(first_name: nil, last_name: nil, date_of_birth: nil, date_of_death: nil)
      self.first_name = first_name
      self.last_name = last_name
      self.date_of_birth = date_of_birth
      self.date_of_death = date_of_death

    end

    def run
      run_query
    end

    def run_query
      @run_query ||= ActiveRecord::Base.connection.execute(query)
    end

    # probably a good idea to use ActiveRecord but let's just do SQL query to show what we can do.
    def query
      query = <<~HEREDOC
        SELECT *
        FROM Directors d
        INNER JOIN movie_directors ma ON d.id = ma.did
        INNER JOIN movies m on ma.mid = m.id
        WHERE (LOWER(d.first) LIKE LOWER(?) OR LOWER(?) IS NULL)
        AND (LOWER(d.last) LIKE LOWER(?) OR LOWER(?) IS NULL)
        AND (d.dob = ? OR ? IS NULL)
        AND (d.dod = ? OR ? IS NULL)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, "%#{first_name}%", "%#{first_name}%", "%#{last_name}%", "%#{last_name}%", date_of_birth, date_of_birth, date_of_death, date_of_death])

    end
  end
end

