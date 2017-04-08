class UserStock < ActiveRecord::Base
    #belongs_to Specifies a one-to-one association with another class
    belongs_to :user
    belongs_to :stock
end
