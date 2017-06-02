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
    contact = Contact.new({
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      bio:params[:bio],
      email: params[:email],
      phone_nber: params[:phone_nber],
      latitude: params[:latitude],
      longitude: params[:longitude]
      })
    contact.save
    flash[:success] = "New Contact Added!!!"
    redirect_to "/contacts/#{@contact.id}"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update 
    contact = Contact.find_by(id: params[:id])
    contact.assign_attributes({
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      bio:params[:bio],
      email: params[:email],
      phone_nber: params[:phone_nber],
      latitude: params[:latitude],
      longitude: params[:longitude]
      })
    contact.save
    flash[:success] = "Contact Updated!!!"
    redirect_to "/contacts/"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:success] = "Contact Deleted"
    redirect_to "/contacts"
  end 

  # def address
  # coordinates = Geocoder.coordinates(address)
  # end

  def search
    search_query = params[:search_input]
    @contacts = Contact.where("name LIKE ? OR description LIKE ?", "%#{search_query}%", "%#{search_query}%")
    if @contacts.empty?
      flash[:info] = "No contacts found in search"
    end
    render :index
  end

end 