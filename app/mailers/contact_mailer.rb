class ContactMailer < ApplicationMailer

	def notify_admin_of_contact_message(contact)
		@contact = contact
		if @contact
			mail(to: "nancytestingemail@gmail.com",
			subject: "New message from Subscription Sample App")
		end
	end

end
