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

  # registrationsコントローラーを変更できるようにする（カスタマイズに必要）
  Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  end

  # メソッドを追加するためにscopeを設定
  devise_scope :user do
    patch 'users/edit/confirm', to:'users/registrations#confirm'
    patch 'users/edit/complete', to:'users/registrations#complete'
  end

  # userのルートを指定（resourceの不要なアクションを使わないようにする）
  resource :user ,only: [:show] do
    collection do
    # get 'conform'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
