# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do
  let!(:user) { @user = FactoryBot.create(:user) }

  describe 'POST #index' do
    it 'should not write post when not logged in' do
      friendship_params = FactoryBot.attributes_for(:friendship, :accepted)
      expect do
        post :create, params: { post: friendship_params }
      end.to_not change(Friendship, :count)
    end
  end
end
