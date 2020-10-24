class ContactsController < ApplicationController
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path, notice: 'Message sent successfully!'
    else
      flash.now[:error] = 'Cannot send message.'
      redirect_to root_path
    end
  end
end
