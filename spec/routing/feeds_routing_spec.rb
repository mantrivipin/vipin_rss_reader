require 'rails_helper'

RSpec.describe 'FeedsController', type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/feeds').to route_to('feeds#index')
    end

    it 'routes to #show' do
      expect(get: '/feeds/1').to route_to('feeds#show', id: '1')
    end

    it 'routes to #new' do
      expect(get: '/feeds/new').to route_to('feeds#new')
    end
 
    it 'routes to #update via PUT' do
      expect(put: '/feeds/1').to route_to('feeds#update', id: '1')
    end
  
    it 'routes to #update via PATCH' do
      expect(patch: '/feeds/1').to route_to('feeds#update', id: '1')
    end
  
    it 'routes to #destroy via DELETE' do
      expect(delete: '/feeds/1').to route_to('feeds#destroy', id: '1')
    end
  end
end
