Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'achievements', to: 'achievements#index'
  devise_for :users

  resources :habits
end
