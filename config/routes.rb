Rails.application.routes.draw do
  root to: 'orders#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  
  namespace :api do
   resources :orders, only: [:create], :defaults => { :format => 'json' }
   get 'dishes', to: 'dishes#index'
   get 'document', to: 'documents#index'
  end

  namespace :admin do
    resources :dishes do
      member do
        put 'toggle_active'
      end
    end
    resources :orders do
      member do
        put 'change_status'
      end
    end
  end

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  resources :sessions
end
