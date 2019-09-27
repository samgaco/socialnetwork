class Friendship < ApplicationRecord
    belongs_to :friend_active, class_name "user"
    belongs_to :friend_passive, class_name "user"
end
