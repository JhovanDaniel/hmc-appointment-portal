Rails.application.routes.draw do
  resources :appointments
  resources :appointment_tests
  resources :locations
  get 'appointment_tests/:id/show_certificate', to: 'appointment_tests#show_certificate', as: :show_certificate
  get "appointments", :to => 'appointments#index'
  get "admin-panel", :to => 'pages#admin_index'
  devise_for :users
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'
  
end
