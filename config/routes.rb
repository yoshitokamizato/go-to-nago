Rails.application.routes.draw do

  get 'bookmarks/create'
  get 'bookmarks/destroy'
  root to:'facilities#index'
  get '/facility/list',to:'facilities#show_facility'
  get '/bookmarks',to:"facilities#bookmark"
  get '/gourmet/list',to:'facilities#show_gourmet'

  #bookmarkのルーティング facilities/bookmarksにルーティング
  resources :facilities, shallow: true do
    #単数形のメソッドであるresourceとしたのはbookmarkのidが必要ないため。
    # ネスト(入れ子)すると外部キーのboard_idを取得するのが容易
    resource :bookmarks, only: %i[create destroy]
    resources :menus
    get :bookmarks, on: :collection
  end

  Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  end
  resource :user ,only: [:show] do
    collection do
    # get 'new'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
