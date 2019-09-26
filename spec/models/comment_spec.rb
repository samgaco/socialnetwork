# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post)
  end

  let(:comment) { @comment = FactoryBot.create(:comment) }

  describe 'when creating a comment' do
    it "doesn't allow a comment with less than two characters" do
      comment.text = 'a'
      expect { comment.save }.to change { comment.errors.full_messages.count }
    end

    it 'creates a new comment' do
      expect { comment }.to change { Comment.count }.by(1)
    end

    it 'has text' do
      expect(comment.text).not_to be_nil
    end
  end

  # test associations

  describe 'it belongs to one post and one user' do
    it 'is associated to users (belongs to one)' do
      us = Comment.reflect_on_association(:user)
      expect(us.macro).to eq(:belongs_to)
    end

    it 'is associated to users (belongs to one)' do
      us = Comment.reflect_on_association(:post)
      expect(us.macro).to eq(:belongs_to)
    end
  end
end
