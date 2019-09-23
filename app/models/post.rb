# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  default_scope { order(created_at: :desc) }

  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { minimum: 20 }
end
