module ReviewServices
  class Index
    attr_accessor :name, :time, :mid, :rating, :comment

    def initialize(name: nil, time: nil, mid: nil, rating: nil, comment: nil)
      self.name = name
      self.time = time
      self.mid = mid
      self.rating = rating
      self.comment = comment

    end

    def run

      result = run_query

      return

    end

    def run_query
      @run_query ||= ActiveRecord::Base.connection.execute(query)
    end

    # probably a good idea to use ActiveRecord but let's just do SQL query to show what we can do.
    def query
      query = <<~HEREDOC
        SELECT *
        FROM Reviews r
        WHERE (r.name = ? OR ? IS NULL)
        AND (r.time = ? OR ? IS NULL)
        AND (r.mid = ? OR ? IS NULL)
        AND (r.rating = ? OR ? IS NULL)
        AND (r.comment = ? OR ? IS NULL)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, name, name, time, time, mid, mid, rating, rating, comment, comment])

    end

  end
end