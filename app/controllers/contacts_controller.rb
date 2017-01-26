class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def show 
    @contact = Contact.find_by(id: params[:id])
  end

  def new
  end

  def create
    @contact = Contact.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_nber: params[:phone_nber]
      })
    @contact.save
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update 
    @contact = Contact.find_by(id: params[:id])
    @contact.assign_attributes({
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_nber: params[:phone_nber]
      })
    @contact.save
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
  end

end 