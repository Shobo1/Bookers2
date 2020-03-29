Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  devise_for :users
  root 'post_images#index'
  resources :books
  get '/home/about' => 'post_images#about', as: 'about'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
