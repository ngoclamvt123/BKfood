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
    resources :dishes
    resources :orders do
      member do
        put 'change_status'
      end
    end
  end

end
