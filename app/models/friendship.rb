# frozen_string_literal: true

class Friendship < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  # validations
  validates :status, inclusion: { in: [true, false] }

  # scopes
  scope :already, ->(user, friend) { where('user_id = (?)', user).where('friend_id = (?)', friend) }
  scope :invitation_requests, ->(user, friend) { where('status = (?)', false).where('friend_id = (?)', user.id).where('user_id = (?)', friend.id) }
  scope :invitation_sent, ->(user, friend) { where('status = (?)', false).where('friend_id = (?)', friend.id).where('user_id = (?)', user.id) }
  scope :friends_active, ->(user) { where('status = (?) = ', true).where('user_id = (?)', user) }
  scope :friends_passive, ->(user) { where('status = (?) = ', true).where('friend_id = (?)', user) }
  scope :act_pas_friends?, ->(user, friend) { where('user_id = (?)', user).where('friend_id = (?)', friend).where('status=(?)', true) }
  scope :accepted_friendships, ->(user) { where('user_id = :id OR friend_id = :id', id: user.id).where('status = (?)', true) }
end
