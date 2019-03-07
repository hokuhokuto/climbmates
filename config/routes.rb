Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  #Login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  

  #User
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update]
  
  #Group
  get 'allgroups', to: 'groups#index'
  get 'mygroups', to: 'groups#my_groups'
  resources :groups
  
  #GroupRelationship
  resources :group_relationships, only: [:create, :destroy, :update]
  
  #Ivent
  resources :ivents, only: [:new, :show, :create, :edit, :update, :destroy]
  
end
