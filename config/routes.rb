Rails.application.routes.draw do
  # resources :places

  # namespace :api do
  #   namespace :v1 do
  #     resources :places
  #   end
  # end


  scope module: :'api/v1'  do
    resources :places
  end
    
  
end
