class AddImageToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :subs_image, :string
  end
end
