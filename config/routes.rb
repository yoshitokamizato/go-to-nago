Rails.application.routes.draw do

  get 'bookmarks/create'
  get 'bookmarks/destroy'
  devise_for :users
  root to:'facilities#index'
  get '/facilities/details',to:'facilities#details'
  get '/facility/list',to:'facilities#show_facility'
  get '/bookmarks',to:"facilities#bookmark"
  get '/gourmet/list',to:'facilities#show_gourmet'

  #bookmarkのルーティング facilities/bookmarksにルーティング
  resources :facilities, shallow: true do
    #単数形のメソッドであるresourceとしたのはbookmarkのidが必要ないため。
    # ネスト(入れ子)すると外部キーのboard_idを取得するのが容易
    resource :bookmarks, only: %i[create destroy]
    get :bookmarks, on: :collection
  end

  get 'users/mypage',to: 'users#mypage'
  get 'users/confirm', to: 'users#confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
