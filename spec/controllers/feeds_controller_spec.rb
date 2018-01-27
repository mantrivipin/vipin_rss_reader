require 'spec_helper'
require 'rails_helper'

RSpec.describe 'FeedsController', type: :controller do
  describe 'Feeds controller request specs' do
    login_user
 
    context 'GET #index' do
      it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end

    context 'GET #show' do
      let!(:feed) { create :feed }
 
      it 'should success and render to show page' do
        get :show, params: { id: feed.id }
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
      end
      
      it 'should not render to edit page' do
        get :show, params: {id: feed.id }
        expect(response).not_to render_template :edit
      end
    end
    
    context 'POST #create' do
      let!(:feed) { FactoryGirl.create :feed }
 
      it 'create a new feed' do
        params = {
          name: 'An awesome article',
          url: 'www.example.com',
          description: 'This is awesome'
        }
        expect { post(:create, params: { feed: params }) }.to change(Feed, :count).by(1)
        expect(flash[:notice]).to eq 'Feed was successfully created.'
      end
    end
    
    context 'DELETE #destroy' do
      let!(:feed) { create :feed }

      it 'should delete feed' do
        expect { delete :destroy, params: { id: feed.id } }.to change(feed, :count).by(-1)
        expect(flash[:notice]).to eq 'Feed was successfully deleted.'
      end
    end
  end
end
