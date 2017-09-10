require 'rails_helper'

RSpec.describe "MovieDirectors", type: :request do
  describe "GET /movie_directors" do
    it "works! (now write some real specs)" do
      get movie_directors_path
      expect(response).to have_http_status(200)
    end
  end
end
