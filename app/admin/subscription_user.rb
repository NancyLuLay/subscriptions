ActiveAdmin.register SubscriptionUser do
  permit_params :user_id, :subscription_id, :stripe_txn_id

  index do
    selectable_column
    id_column
    column :user_id
    column :subscription_id
    column :stripe_txn_id
    column 'Refund' do |s|
      link_to "Refund", subscription_users_refund_path(s)
    end
    actions
  end

  filter :user_id, as: :select, collection: User.all.map{|x| [x.email, x.id]}
  filter :subscription_id
  filter :stripe_txn_id

  form do |f|
    f.inputs "Add a subscription to a usser" do
      f.input :subscription, as: :select, collection: Subscription.all.map {|subscription| [subscription.title]}
      f.input :user_id, as: :select, collection: User.all.map{ |user| [user.email, user.id]}
      f.input :stripe_txn_id
    end
    f.actions
  end

  show do
    attributes_table do
      row :user_id
      row :subscription_id
      row :stripe_txn_id
    end
  end
end
