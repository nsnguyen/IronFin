module MovieServices
  class Index
    attr_accessor :title , :year, :rating, :company

    def initialize(movie_title: nil, movie_release_year: nil, movie_rating: nil, company_name: nil)
      self.title = movie_title
      self.year = movie_release_year
      self.rating = movie_rating
      self.company = company_name

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
        FROM Movies m
        WHERE (LOWER(m.title) = LOWER(?) OR LOWER(?) IS NULL)
        AND (m.year = ? OR ? IS NULL)
        AND (m.rating = ? OR ? IS NULL)
        AND (m.company = ? OR ? IS NULL)

      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, title, title, year, year, rating, rating, company, company])

    end

  end
end

