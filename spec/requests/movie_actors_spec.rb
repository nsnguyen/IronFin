require 'rails_helper'

RSpec.describe "MovieActors", type: :request do
  describe "GET /movie_actors" do
    it "works! (now write some real specs)" do
      get movie_actors_path
      expect(response).to have_http_status(200)
    end
  end
end
