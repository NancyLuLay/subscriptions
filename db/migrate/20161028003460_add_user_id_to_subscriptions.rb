class AddUserIdToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :user_id, :string
  end
end
