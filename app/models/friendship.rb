class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, :class_name => "User"


    scope :already, ->(user, friend) { where("user_id = (?)", user).where("friend_id = (?)", friend) }
    scope :invitation_requests, ->(user){where("friend_id = (?)", user).where("status = (?)", false)}
    scope :invitation_sent, ->(user){where("user_id = (?)", user).where("status = (?)", false)}
    scope :friends_active, ->(user){where("status = (?) = ", true).where("user_id = (?)", user)}  
    scope :friends_passive, ->(user){where("status = (?) = ", true).where("friend_id = (?)", user)} 
    scope :act_pas_friends?, ->(user, friend){where("user_id = (?)", user).where("friend_id = (?)", friend).where("status=(?)", true)}

end