Rails.application.routes.draw do
  root "users#new"
  resources :users

  get	    '/login',	    to: 'users#new'
  post	  '/login',	    to: 'sessions#create'
  delete  '/logout',	  to: 'sessions#destroy'

  post    '/ideas',     to: 'ideas#create'
  get     '/ideas',     to: 'ideas#index'
  get     '/ideas/:id', to: 'ideas#show'
  delete  '/idea/:id',  to: 'ideas#destroy'

  post    '/likes',     to: 'likes#create'
  delete  '/likes/:id', to: 'likes#destroy'

  get "*path" => redirect("/")

end
