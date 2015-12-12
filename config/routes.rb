Rails.application.routes.draw do
  root to: 'visitors#index'
  get 'achievements', to: 'achievements#index'
  devise_for :users

  resources :habits
    
  get 'history', to: 'habits#history', as: :habit_history
end
