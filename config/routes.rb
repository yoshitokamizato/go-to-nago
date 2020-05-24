Rails.application.routes.draw do
 
  devise_for :users
  root to:'facilities#index'
  get '/facility/list',to:'facilities#show_facility'
  get '/gourmet/list',to:'facilities#show_gourmet'
  get 'users/mypage',to: 'users#mypage'
  get 'users/confirm', to: 'users#confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
