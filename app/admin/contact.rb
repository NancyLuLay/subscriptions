ActiveAdmin.register Contact do

	menu label: "Messages"
	permit_params :name, :email, :subject, :message, :created_at

	index do
		selectable_column
		id_column
		column :name
		column :email
		column :subject
		column :message
		column :created_at
		actions
	end

end
