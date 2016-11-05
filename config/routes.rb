Rails.application.routes.draw do
  devise_for :users
  root 'reviews#index'
  get 'reviews' => 'reviews#index'

end
