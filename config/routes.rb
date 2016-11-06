Rails.application.routes.draw do
  devise_for :users
  root 'restaurants#index'
  get 'restaurants' => 'restaurants#index'
  get 'restaurants/:id' => 'restaurants#show'
  resources :restaurants do
    resources :reviews, only: [:create,:edit]
  end
  delete 'reviews/:id' => 'reviews#destroy'
  get 'reviews/:id/edit' => 'reviews#edit'
  patch 'reviews/:id' => 'reviews#update'
end
