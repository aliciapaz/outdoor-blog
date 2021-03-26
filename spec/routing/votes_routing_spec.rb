require 'rails_helper'

RSpec.describe VotesController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/articles/1/votes/new').to route_to('votes#new', article_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/articles/1/votes').to route_to('votes#create', article_id: '1')
    end
  end
end
