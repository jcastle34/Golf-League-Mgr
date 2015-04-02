require "spec_helper"

describe HandicapsController do
  describe "routing" do

    it "routes to #index" do
      get("/handicaps").should route_to("handicaps#index")
    end

    it "routes to #new" do
      get("/handicaps/new").should route_to("handicaps#new")
    end

    it "routes to #show" do
      get("/handicaps/1").should route_to("handicaps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/handicaps/1/edit").should route_to("handicaps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/handicaps").should route_to("handicaps#create")
    end

    it "routes to #update" do
      put("/handicaps/1").should route_to("handicaps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/handicaps/1").should route_to("handicaps#destroy", :id => "1")
    end

  end
end
