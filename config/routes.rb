Rails.application.routes.draw do
  root "users#new"
  resources :users

  get	  '/login',	    to: 'users#new'
  post	'/login',	    to: 'sessions#create'
  delete'/logout',	  to: 'sessions#destroy'


  get "*path" => redirect("/")

end
