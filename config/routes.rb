Rails.application.routes.draw do
  root to:'facilities#index'
  get '/facilities/list',to:'facilities#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
