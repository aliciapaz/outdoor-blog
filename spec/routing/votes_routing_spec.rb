require "rails_helper"

RSpec.describe VotesController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/articles/1/votes/new").to route_to("votes#new")
    end

    it "routes to #create" do
      expect(post: "/articles/1/votes").to route_to("votes#create")
    end

    it 'routes to #destroy' do
      expect(delete: '/posts/1/likes/1').to route_to('likes#destroy', article_id: '1', id: '1')
    end
  end
end