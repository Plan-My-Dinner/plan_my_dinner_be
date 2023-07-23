Rails.application.routes.draw do
  root 'rails/welcome#index'
    namespace :api do
    namespace :v1 do
      resources :random_recipes, only: [:index]
    end 
  end 
end
