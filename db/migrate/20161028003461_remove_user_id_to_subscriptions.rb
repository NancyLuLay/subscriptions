class RemoveUserIdToSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :user_id, :string
  end
end
