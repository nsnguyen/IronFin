module MovieActorServices
  class Index
    attr_accessor :title, :year, :rating, :company

    def initialize(mid: nil, aid: nil, role: nil)
      self.mid = mid
      self.aid = aid
      self.role = role
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
        FROM MovieActors ma
        WHERE (ma.mid = ? OR ? IS NULL)
        AND (ma.aid = ? OR ? IS NULL)
        AND (ma.role = ? OR ? IS NULL)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, mid, mid, aid, aid, role, role])

    end

  end
end
