# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { @user = FactoryBot.create(:user) }

  describe 'GET #index' do
    it 'returns http success' do
      sign_in(@user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'should not write post when not logged in' do
      post = { post: { title: 'greaat', content: 'a' * 50 } }
      sign_in(@user)
      expect do
        post(:create, params: post)
      end.to change(Post, :count).by(1)
    end

    it 'should not write post when not logged in' do
      post_params = FactoryBot.attributes_for(:post)
      expect do
        post :create, params: { post: post_params }
      end.to_not change(Post, :count)
    end
  end

  ### Pending test (Remaining Crud operations not requested for the project)

  describe 'GET #edit' do
    it 'returns http success' do
      pending('still not implemented')
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      pending('still not implemented')
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #delete' do
    it 'deletes a post' do
      pending('yet to implement')
      expect { post :destroy }.to change(Post, :count).by(-1)
    end
  end

  describe 'POST #delete' do
    it 'can not delete a post not created by current user' do
      pending('yet to implement')
      expect { post(:destroy) }.to change(Post, :count).by(-1)
    end
  end

  describe 'POST #update' do
    it 'can not update a post not created by current user' do
      pending('yet to implement')
      expect { post :update }.to
    end
  end
end
