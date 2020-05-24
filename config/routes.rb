Rails.application.routes.draw do
 
  devise_for :users
  root to:'facilities#index'
  get '/facilities/list',to:'facilities#show'
  get '/facilities/details',to:'facilities#details'
  get 'users/mypage',to: 'users#mypage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
