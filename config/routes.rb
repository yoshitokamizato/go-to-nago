Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "bookmarks/create"
  get "bookmarks/destroy"
  root to: 'facilities#index'
  get "/facility/list", to: 'facilities#show_facility'
  get "/bookmarks", to: 'facilities#bookmark'
  get "/gourmet/list", to: 'facilities#show_gourmet'
  get "/about", to: 'fixedpages#about'
  get "/company", to: 'fixedpages#company'
  get "/privacy", to: 'fixedpages#privacy'
  get "/tos", to: 'fixedpages#tos'

  # bookmarkのルーティング facilities/bookmarksにルーティング
  resources :facilities, shallow: true do
    # 単数形のメソッドであるresourceとしたのはbookmarkのidが必要ないため。
    # ネスト(入れ子)すると外部キーのboard_idを取得するのが容易
    resource :bookmarks, only: %i(create destroy)
    resources :menus
    get :bookmarks, on: :collection
  end

  # deviseのコントローラーを変更するためのコマンド
  devise_for :users, controllers: {
    registrations: "users/registrations",
    confirmations: 'users/confirmations',
  }


    # 追加したアクションのルートを定義
    devise_scope :user do
      # パスワード編集のルートを設定
      get 'users/edit/password' => 'users/registrations#edit_password'
      put 'users/update/password' => 'users/registrations#update_password'
      # email編集のルートを設定
      get 'users/edit/email' => 'users/registrations#edit_email'
      put 'users/update/email' => 'users/registrations#update_email'
      get  'users/update/email/confirm' =>'users/registrations#update_email_confirm'

      # 新規登録画面
      get 'users/temp' => 'users/registrations#temp'
      post 'users/temp' => 'users/registrations#temp'
#      get 'users/regist' => 'users/registrations#regist'
#      post 'users/regist' => 'users/registrations#regist'
#      get 'users/confirm' => 'users/registrations#confirm'
#      post 'users/confirm' => 'users/registrations#confirm'
#      patch 'users/registcomp' => 'users/registrations#registcomp'
#      put 'users/registcomp' => 'users/registrations#registcomp'

      #プロフィール編集画面（仮登録状態）
      get "before_sign_up", to: "users/registrations#regist"
      #プロフィール編集内容確認画面（仮登録状態）
      post "before_sign_up_confirm",to: "users/registrations#confirm"
      #プロフィール編集内容のアップデート処理（仮登録→本登録に）
      post "before_sign_up",to:"users/registrations#registcomp"

    end
  # resource
  resource :user, only: [:show] do
    collection do
      # ここに resourceにない、追加したいメソッドを記入
      # get 'new'
      get "withdraw"
    end
  end
  resources :inquiries, only: [:new, :create] do
    collection do
      post "confirm"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
