Rails.application.routes.draw do
  devise_for :users
  resources :places

  namespace :api do
    namespace :v1 do
      resources :places
    end
  end


    
  
end
