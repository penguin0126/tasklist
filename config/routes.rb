Rails.application.routes.draw do
  root to: 'tasks#index'  
  resources :tasks do
    member do
      get 'completed'
    end
  end
end
