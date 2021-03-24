require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: 'signup').to route_to('users#new')
    end

    it 'routes to #new' do
      expect(get: '/login').to route_to('sessions#new')
    end

    it 'routes to #show' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/users').to route_to('users#create')
    end

    it 'routes to #create' do
      expect(post: '/login').to route_to('users#create')
    end

    it 'routes to #logout' do
      expect(post: '/logout').to route_to('users#logout')
    end
  end
end
