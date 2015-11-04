Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  root "dinners#index"
  get '/login', to: redirect('/auth/facebook')
  get 'auth/:facebook/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :dinners do
    resources :menu_items, except: [:edit, :update, :show]
    resources :invitations
    resources :dish_assignments, except: [:edit, :update, :show]
  end

  resources :users
  resources :guests 
  resources :hosts
end
