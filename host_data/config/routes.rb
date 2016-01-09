Rails.application.routes.draw do

    # 職員向け
    namespace :staff do
        root 'top#index'
        # /staff/loginへのリクエストが届いたらstaff/sessionsコントローラのnewアクションが処理する
        get 'login' => 'sessions#new', as: :login
        # /staff/sessionへのPOSTリクエストが届いたらstaff/sessionsコントローラのcreateアクションが処理する
        # sessionシンボルを設定しerbで設定できるようにする
        post 'session' => 'sessions#create', as: :session
        # /staff/sessionへのdeleteリクエストが届いたらstaff/sessionsコントローラのdestroyアクションが処理する
        delete 'session' => 'sessions#destroy'
    end

    # 管理者向け
    namespace :admin do
        root 'top#index'
        get 'login' => 'sessions#new', as: :login
        post 'session' => 'sessions#create', as: :session
        delete 'session' => 'sessions#destroy'
    end

    # 顧客向け
    namespace :customer do
        root 'top#index'
    end

    # ルートにリクエストされた場合の設定
    root 'errors#not_found'

    # 全てのルーティングに合致しなかった場合の設定
    get '*anything' => 'errors#not_found'

end
