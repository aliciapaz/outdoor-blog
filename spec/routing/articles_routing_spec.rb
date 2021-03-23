require "rails_helper"

RSpec.describe ArticlesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/articles").to route_to("articles#index")
    end

    it "routes to #new" do
      expect(get: "/articles/new").to route_to("articles#new")
    end
    
    it "routes to #create" do
      expect(post: "/articles").to route_to("articles#create")
    end

    it "routes to #show" do
      expect(get: "/articles/1").to route_to("articles#show", id: "1")
    end
  end
end
