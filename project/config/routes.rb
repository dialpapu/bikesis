Rails.application.routes.draw do


  resources :sellers

  #get 'sellers/index'

  devise_for :users, :controllers =>{:registrations =>"my_devise/registrations"}

  root to: 'home#index'
  get 'catalog/index'
  
  resources :bikes

  resources :equipment

  resources :accesory_parts

  resources :inventories

  resources :sales

  resources :items

  resources :clients

  resources :contract_histories

  resources :articles

  



end
