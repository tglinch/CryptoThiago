Rails.application.routes.draw do
  resources :mining_types
  resources :coins
  get 'welcome/index'
  root to: "welcome#index"
  get 'inicio', to: 'welcome#index'
  get 'carteira', to: 'coins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
