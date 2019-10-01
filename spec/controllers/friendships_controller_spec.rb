# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let(:user) { User.create(name: 'juan', email: 'bolo@g.com', password: '123456', password_confirmation: '123456') }
  let(:user2) { User.create(name: 'juan2', email: 'bolo2@g.com', password: '123456', password_confirmation: '123456') }

  describe 'POST #index' do
    pending('not working')

    it 'should not write post when not logged in' do
      friendship_params = FactoryBot.attributes_for(:friendship)
      expect do
        post :create, params: { post: friendship_params }
      end.to_not change(Friendship, :count)
    end

    it 'should  write post when not logged in' do
      pending('not working')
      sign_in(user)
      friendship_params = { friend_id: user2.id, user_id: user.id, status: true }
      expect do
        post :create, params: { post: friendship_params }
      end.to change(user.active_friendships, :count).by(1)
    end
  end
end
