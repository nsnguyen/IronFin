module MovieGenreServices
  class Index
    attr_accessor :mid, :genre

    def initialize(mid: nil, genre:nil)
      self.mid = mid
      self.genre = genre

    end

    def run

      result = run_query

      result

    end

    def run_query
      @run_query ||= ActiveRecord::Base.connection.execute(query)
    end

    # probably a good idea to use ActiveRecord but let's just do SQL query to show what we can do.
    def query
      query = <<~HEREDOC
        SELECT *
        FROM MovieGenres mg
        WHERE (mg.mid = ? OR ? IS NULL)
        AND (mg.genre = ? OR ? IS NULL)

      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, mid, mid, genre, genre])

    end

  end
end

