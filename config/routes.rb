Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books 	
  root 'pages#home'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'pages/about' => 'pages#about'
  get 'signup' => 'users#new'
  resources :users, except: [:new]
  resources :borrows, except: [:new]
end
