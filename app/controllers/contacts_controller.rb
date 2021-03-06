class ContactsController < ApplicationController
	def new
		@contact = Contact.new 
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash[:notice] = 'Thank you for your message!'
			redirect_to root_path
		else
			flash[:error] = 'Cannot send message.'
			redirect_to root_path
		end
	end
end
