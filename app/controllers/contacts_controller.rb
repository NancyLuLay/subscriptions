class ContactsController < ApplicationController

	def new
	end

	def create
		@contact = Contact.new params.require(:contact).permit([:name, :email, :subject, :message])
		if @contact.save
			ContactMailer.notify_admin_of_contact_message(@contact).deliver_now
			redirect_to root_path, notice: "Thank you. Your message have been sent"
		else
			redirect_to root_path, alert: "Sorry, Try sending your message again"
		end
	end

end
