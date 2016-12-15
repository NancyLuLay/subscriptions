class Subscription < ActiveRecord::Base
  has_many :users

  mount_uploader :subs_image, SubsImageUploader
end
