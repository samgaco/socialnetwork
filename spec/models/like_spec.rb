# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end

  describe 'when creating a new like' do
    it 'creates a new comment' do
      like = Like.new
      like.user = @user
      like.post = @post
      expect { like.save }.to change { Like.count }.by(1)
    end
  end

  describe 'it belongs to one post and one user' do
    it 'is associated to users (belongs to one)' do
      us = Like.reflect_on_association(:user)
      expect(us.macro).to eq(:belongs_to)
    end

    it 'is associated to users (belongs to one)' do
      us = Like.reflect_on_association(:post)
      expect(us.macro).to eq(:belongs_to)
    end
  end
end
