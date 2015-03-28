require "spec_helper"

describe LeagueTeamsController do
  describe "routing" do

    it "routes to #index" do
      get("/league_teams").should route_to("league_teams#index")
    end

    it "routes to #new" do
      get("/league_teams/new").should route_to("league_teams#new")
    end

    it "routes to #show" do
      get("/league_teams/1").should route_to("league_teams#show", :id => "1")
    end

    it "routes to #edit" do
      get("/league_teams/1/edit").should route_to("league_teams#edit", :id => "1")
    end

    it "routes to #create" do
      post("/league_teams").should route_to("league_teams#create")
    end

    it "routes to #update" do
      put("/league_teams/1").should route_to("league_teams#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/league_teams/1").should route_to("league_teams#destroy", :id => "1")
    end

  end
end
