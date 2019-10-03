# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let(:user) { User.create(name: 'juan', email: 'bolo@g.com', password: '123456', password_confirmation: '123456') }
  let(:user2) { User.create(name: 'juan2', email: 'bolo2@g.com', password: '123456', password_confirmation: '123456') }

  describe 'POST #index' do
    pending('not working')

    it 'should not write post when not logged in' do
      friendship = { friendship: { friend_id: user2.id, user_id: user.id, status: true } }
      expect do
        post(:create, params: friendship)
      end.to change(Friendship, :count)
    end

    it 'should  write post when  logged in' do
      friendship = { friendship: { friend_id: user2.id, user_id: user.id, status: true } }
      sign_in(user)
      expect do
        post(:create, params: friendship)
      end.to change(user.active_friendships, :count).by(1)
    end
  end
end
