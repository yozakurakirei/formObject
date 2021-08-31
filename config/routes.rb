Rails.application.routes.draw do
  resources :admins
  resources :companies
  resources :staffs
  root "admins#index"
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
