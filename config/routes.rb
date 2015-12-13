Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'achievements', to: 'achievements#index'
  devise_for :users

  resources :habits do
  	resources :tasks, only: [:create]
  end
    
  get 'history', to: 'habits#history', as: :habit_history
end
