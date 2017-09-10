require "rails_helper"

RSpec.describe MovieDirectorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/movie_directors").to route_to("movie_directors#index")
    end


    it "routes to #show" do
      expect(:get => "/movie_directors/1").to route_to("movie_directors#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/movie_directors").to route_to("movie_directors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/movie_directors/1").to route_to("movie_directors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/movie_directors/1").to route_to("movie_directors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/movie_directors/1").to route_to("movie_directors#destroy", :id => "1")
    end

  end
end
