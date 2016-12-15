class RemoveDescAddDesc1Desc2Dec3ToSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :description
    add_column :subscriptions, :description1, :text
    add_column :subscriptions, :description2, :text
    add_column :subscriptions, :description3, :text
  end
end
