ActiveAdmin.register User do
  permit_params :first_name, :last_name, :profile_picture, :email, :subscription_id

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column "Picture" do |c|
      if c.provider == nil
        image_tag c.profile_picture.url("thumb")
      elsif c.provider == "google_oauth2" || "facebook"
        image_tag c.avatar, style: "max-height: 10%"
      end
    end
    column :email
    column "Subscription Id" do |user|
      user.subscription_id
    end
    column :stripe_customer_id
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :subscription_id

  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :profile_picture
      f.input :avatar
      f.input :email
      f.input :subscription_id, as: :select, collection: Subscription.all.map{ |subscription| [subscription.title]}

      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
     row :first_name
     row :last_name
     row "Picture" do |c|
       if c.provider == nil
         image_tag c.profile_picture.url("medium")
       elsif c.provider == "google_oauth2" || "facebook"
         image_tag c.avatar, style: "max-height: 20%"
       end
     end
     row :email
     row :subscription_id
    end
  end

end
