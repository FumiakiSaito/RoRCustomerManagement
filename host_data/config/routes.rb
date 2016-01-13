Rails.application.routes.draw do

    # 職員向け

    # コンフィグ値取得
    config = Rails.application.config.baukis

    constraints host: config[:staff][:host] do
      namespace :staff, path: config[:staff][:path] do
          root 'top#index'
          # /staff/loginへのリクエストが届いたらstaff/sessionsコントローラのnewアクションが処理する
          get 'login' => 'sessions#new', as: :login
          # /staff/sessionへのPOSTリクエストが届いたらstaff/sessionsコントローラのcreateアクションが処理する
          # sessionシンボルを設定しerbで設定できるようにする
          post 'session' => 'sessions#create', as: :session
          # /staff/sessionへのdeleteリクエストが届いたらstaff/sessionsコントローラのdestroyアクションが処理する
          delete 'session' => 'sessions#destroy'

          # 単数リソース(ただし自分自身が登録、削除する機能は不要なのでexceptで除外する)
          resource :account, except: [ :new, :create, :destroy]
      end
    end

    # 管理者向け
    constraints host: config[:admin][:host] do
      namespace :admin, path: config[:admin][:path] do
          root   'top#index'
          get    'login'                  => 'sessions#new', as: :login
          post   'session'                => 'sessions#create', as: :session
          delete 'session'                => 'sessions#destroy'
=begin
          get    'staff_members'          => 'staff_members#index'
          get    'staff_members/:id'      => 'staff_members#show'
          get    'staff_members/new'      => 'staff_members#new'
          get    'staff_members/:id/edit' => 'staff_members#edit'
          post   'staff_members'          => 'staff_members#create'
          patch  'staff_members/:id'      => 'staff_members#update'
          delete 'staff_members/:id'      => 'staff_members#destroy'
=end
          # ↑同様(複数リソース)
          resources :staff_members do
            # ネストされたリソース
            # admin/staff_members/:staff_member_id/staff_events::indexが設定される
            resources :staff_events, only: [ :index ]
          end
          resources :staff_events, only: [ :index ]
      end
    end

    # 顧客向け
    constraints host: config[:admin][:host] do
      namespace :customer, path: config[:customer][:path] do
        root 'top#index'
      end
    end

    # ルートにリクエストされた場合の設定
    root 'errors#not_found'

    # 全てのルーティングに合致しなかった場合の設定
    get '*anything' => 'errors#not_found'

end
