Rails.application.routes.draw do
  resources :articles#, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :users, except: [:new]
  root "pages#home"
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
end
