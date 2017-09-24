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
      # get initital movies data in PG
      movies = run_query

      # build movie_ids array so it can pass into second SQL query to search for genres.
      movie_ids = movie_ids(movies)

      # convert to hashes so we can add genres in easily.
      movie_hashes = as_hashes(movies)

      # pash movie_hashes as reference. Fill Genres class will append movie genres.
      MovieServices::FillGenres.new(movie_hashes, movie_ids).run

      movie_hashes
    end

    def movie_ids(movies)
      # this is to put movie_ids into an array
      movies.pluck('id')
    end

    def run_query
      @run_query ||= ActiveRecord::Base.connection.execute(query)
    end

    def as_hashes(movies)
      movies.map do |movie|
        {
            'id' => movie['id'],
            'title' => movie['title'],
            'year' => movie['year'],
            'rating' => movie['rating'],
            'company' => movie['company'],
            'genre' => []
        }
      end
    end

    # probably a good idea to use ActiveRecord but let's just do SQL query to show what we can do.
    def query
      query = <<~HEREDOC
        SELECT *
        FROM Movies m
        WHERE (LOWER(m.title) LIKE LOWER(?) OR LOWER(?) IS NULL)
        AND (m.year = ? OR ? IS NULL)
        AND (LOWER(m.rating) = LOWER(?) OR LOWER(?) IS NULL)
        AND (LOWER(m.company) LIKE LOWER(?) OR LOWER(?) IS NULL)
      HEREDOC

      ActiveRecord::Base.send(:sanitize_sql, [query, "%#{title}%", "%#{title}%", year, year, rating, rating, "%#{company}%", "%#{company}%"])
    end
  end
end

