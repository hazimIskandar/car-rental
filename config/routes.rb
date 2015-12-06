Rails.application.routes.draw do

  get 'messages/new'
  get 'car' => 'landing_pages#car'

   root 'landing_pages#index'
   resources :messages, only: [:new, :create]
 
end
