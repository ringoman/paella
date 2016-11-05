Rails.application.routes.draw do
  devise_for :users
  root 'restaurants#index'
  get 'restaurants' => 'restaurants#index'

end
