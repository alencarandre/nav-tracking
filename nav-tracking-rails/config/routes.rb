Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :trackings, only: [:index]
  resources :contacts, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :contacts, only: [:create]
    end
  end

  root 'dashboard#index'
end
