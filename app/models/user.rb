# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]
  # validates :name, :uniqueness => {:case_sensitive => false}
  has_many :posts
  has_many :comments
  has_many :likes

  has_many :active_friendships, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :passive_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  has_many :friendships, lambda { |user|
    unscope(:where).where('user_id = :id OR friend_id = :id', id: user.id)
  }, class_name: :Friendship, dependent: :destroy

  has_many :friendships_accepted, lambda { |user|
    unscope(:where).where('user_id = :id OR friend_id = :id', id: user.id).where('status = (?)', true)
  }, class_name: :Friendship, dependent: :destroy

  has_many :friendships_rec_pending, lambda { |user|
    unscope(:where).where('friend_id = :id', id: user.id).where('status = (?)', false)
  }, class_name: :Friendship, dependent: :destroy

  has_many :friendships_send_pending, lambda { |user|
    unscope(:where).where('user_id = :id', id: user.id).where('status = (?)', false)
  }, class_name: :Friendship, dependent: :destroy

  # validations
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end
end
