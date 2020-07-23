Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  root to:'facilities#index'
  get '/facility/list',to:'facilities#show_facility'
  get '/bookmarks',to:"facilities#bookmark"
  get '/gourmet/list',to:'facilities#show_gourmet'
  get '/about', to: 'fixedpages#about'
  get '/company', to: 'fixedpages#company'
  get '/privacy', to: 'fixedpages#privacy'

  #bookmarkのルーティング facilities/bookmarksにルーティング
  resources :facilities, shallow: true do
    #単数形のメソッドであるresourceとしたのはbookmarkのidが必要ないため。
    # ネスト(入れ子)すると外部キーのboard_idを取得するのが容易
    resource :bookmarks, only: %i[create destroy]
    resources :menus
    get :bookmarks, on: :collection
  end

  # コントローラーを変更するためのコマンド
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }


    # 追加したアクションのルートを定義
    devise_scope :user do
      get 'users/edit/password' => 'users/registrations#edit_password'
      put 'users/update/password' => 'users/registrations#update_password'
    end
  # resource
  resource :user ,only: [:show] do
    collection do
    #ここに resourceにない、追加したいメソッドを記入
    # get 'new'
    get "withdraw"
    end
  end
  resources :inquiries, only: [:new, :create] do
    collection do
      post 'confirm'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
