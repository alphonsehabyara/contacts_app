Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get"/contacts", to: 'contacts#first_contact'
  root to: 'contacts#index'
  get "/contacts", to: 'contacts#index'
  get "/contacts/new", to: 'contacts#new'
  post "/contacts/search", to: 'contacts#search'
  get "/contacts/:id", to: 'contacts#show'
  post "/contacts", to: 'contacts#create'
  get "/contacts/:id/edit", to: 'contacts#edit'
  patch "contacts/:id", to: 'contacts#update'
  delete "contacts/:id", to: 'contacts#destroy'

end
