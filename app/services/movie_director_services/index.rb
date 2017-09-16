module MovieDirectorServices
  class Index
    attr_accessor :mid, :did

    def initialize(mid: nil, did: nil)
      self.mid = mid
      self.did = did
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
        FROM MovieDirectors md
        WHERE (md.mid = ? OR ? IS NULL)
        AND (md.did = ? OR ? IS NULL)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, mid, mid, did, did])

    end

  end
end

