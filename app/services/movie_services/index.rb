module MovieServices
  class Index
    attr_accessor :title , :year, :rating, :company

    def initialize(title: nil, year: nil, rating: nil, company: nil)
      self.title = title
      self.year = year
      self.rating = rating
      self.company = company

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
        FROM Movies m
        WHERE (m.title = ? OR ? IS NULL)
        AND (m.year = ? OR ? IS NULL)
        AND (m.rating = ? OR ? IS NULL)
        AND (m.company = ? OR ? IS NULL)

      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, title, title, year, year, rating, rating, company, company])

    end

  end
end

