class SubscriptionUser < ActiveRecord::Base
  belongs_to :subscription
  belongs_to :user
end
