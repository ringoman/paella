Rails.application.routes.draw do
  root 'reviews#index'
  get 'reviews' => 'reviews#index'

end
