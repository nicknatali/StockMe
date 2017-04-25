class UserStock < ActiveRecord::Base
  # check if a stock belongs to a user
  belongs_to :user
  belongs_to :stock
end
