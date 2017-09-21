# frozen_string_literal: true

module ActorServices
  class Index
    attr_accessor :first_name , :last_name, :sex, :date_of_birth, :date_of_death

    def initialize(first_name: nil, last_name: nil, sex: nil, date_of_birth: nil, date_of_death: nil)
      self.first_name = first_name
      self.last_name = last_name
      self.sex = sex
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
        FROM Actors a
        INNER JOIN movie_actors ma ON a.id = ma.aid
        INNER JOIN movies m on ma.mid = m.id
        WHERE (LOWER(a.first) = LOWER(?) OR LOWER(?) IS NULL)
        AND (LOWER(a.last) = LOWER(?) OR LOWER(?) IS NULL)
        AND (LOWER(a.sex) = LOWER(?) OR LOWER(?) IS NULL)
        AND (a.dob = ? OR ? IS NULL)
        AND (a.dod = ? OR ? IS NULL)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, "%#{first_name}%", "%#{first_name}%", "%#{last_name}%", "%#{last_name}%", sex, sex, date_of_birth, date_of_birth, date_of_death, date_of_death])
    end
  end
end

