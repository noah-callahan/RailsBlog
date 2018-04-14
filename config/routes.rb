Rails.application.routes.draw do
  resources :users
  get '/' => 'welcome#index'
  get '/signup' => 'users#new'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
