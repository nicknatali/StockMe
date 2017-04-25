class Friendship < ActiveRecord::Base
  # friends can belong to a user or a friend
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end
