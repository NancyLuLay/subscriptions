class ChangeTypeSubscriptionDescription < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :description, :string
    add_column :subscriptions, :description, :text
  end
end
