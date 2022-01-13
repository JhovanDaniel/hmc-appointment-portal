Rails.application.routes.draw do
  resources :appointments
  resources :appointment_tests
  get "appointments", :to => 'appointments#index'
  get "admin-panel", :to => 'pages#admin_index'
  devise_for :users
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  
end
