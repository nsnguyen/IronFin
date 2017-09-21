module MovieServices
  class Index
    attr_accessor :title , :year, :rating, :company, :genre

    def initialize(movie_title: nil, movie_release_year: nil, movie_rating: nil, company_name: nil, movie_genre: nil)
      self.title = movie_title
      self.year = movie_release_year
      self.rating = movie_rating
      self.company = company_name
      self.genre = movie_genre

    end

    def run
      result = run_query

      result
      
      # TODO: need to put genre into array of hashes.

      # http://0.0.0.0:3000/v1/movies?company=Jaret%20Entertainment
    end

    def run_query
      @run_query ||= ActiveRecord::Base.connection.execute(query)
    end

    # probably a good idea to use ActiveRecord but let's just do SQL query to show what we can do.
    def query
      query = <<~HEREDOC
        SELECT *
        FROM Movies m
        INNER JOIN movie_genres mg on m.id = mg.mid
        WHERE (LOWER(m.title) LIKE LOWER(?) OR LOWER(?) IS NULL)
        AND (m.year = ? OR ? IS NULL)
        AND (LOWER(m.rating) = LOWER(?) OR LOWER(?) IS NULL)
        AND (LOWER(m.company) LIKE LOWER(?) OR LOWER(?) IS NULL)
        AND (LOWER(mg.genre) = LOWER(?) OR LOWER(?) IS NULL)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, "%{title}%", "%{title}%", year, year, rating, rating, "%{company}%", "%{company}%", genre, genre])
    end
  end
end

