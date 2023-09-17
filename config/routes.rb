Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      ##Recipe endpoints
      get "/recipe/:id", to: "recipe#show" #get recipe information
    end
  end
end
