require "rails_helper"

RSpec.describe MovieActorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/movie_actors").to route_to("movie_actors#index")
    end


    it "routes to #show" do
      expect(:get => "/movie_actors/1").to route_to("movie_actors#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/movie_actors").to route_to("movie_actors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/movie_actors/1").to route_to("movie_actors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/movie_actors/1").to route_to("movie_actors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/movie_actors/1").to route_to("movie_actors#destroy", :id => "1")
    end

  end
end
