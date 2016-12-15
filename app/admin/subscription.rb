ActiveAdmin.register Subscription do
permit_params :title, :description1, :description2, :description3, :price, :quantity, :subs_image

  index do
    selectable_column
    id_column
    column :title
    column "Image" do |s|
      image_tag s.subs_image, style: "height: 100px; width: 150px"
    end
    column :description1 do |subscription|
      truncate("#{subscription.description1}", length: 230)
    end
    column :description2 do |subscription|
      truncate("#{subscription.description2}", length: 230)
    end
    column :description3 do |subscription|
      truncate("#{subscription.description3}", length: 230)
    end
    column :price do |subscription|
      number_to_currency subscription.price
    end
    column :quantity
    actions
  end

  filter :title, as: :select, collection: Subscription.all.map{|x| [x.title, x.id]}
  filter :price, as: :select, collection: Subscription.all.map{|x| [x.price, x.id]}
  filter :quantity

  form do |f|
    f.inputs "Subscription Details" do
      f.input :title
      f.input :subs_image
      f.input :description1
      f.input :description2
      f.input :description3
      f.input :price
      f.input :quantity
    end
    f.actions
  end

  show do
    attributes_table do
     row :title
     row "Image" do |s|
       image_tag s.subs_image, style: "height: 100px; width: 150px"
     end
     row :description1
     row :description2
     row :description3
     row :price do |subscription|
       number_to_currency subscription.price
     end
     row :quantity
    end
  end

end
