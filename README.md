# RoRCustomerManagement(学習メモ)

## vagrant

共有ディレクトリ

ホストOS ↔ ゲストOS  
/Develop/GitHub_FumiakiSaito/RoRCustomerManagement/Vagrant ↔ /vagrant

サーバ起動  
`vagrant up`

接続  
`vagrant ssh`

## Rails

アプリ作成  
`rails new customermanagement -d mysql --skip-test-unit`

Gemファイルに書いたパッケージをインストール    
`bundle`

Gemパッケージリスト表示  
`bundle list`

database.ymlを元にDB作成  
`rake db:create`

rpecインストール  
`rails g rspec:install`

rspec実行  

specディレクトリ配下に任意のディレクトリ・ファイルを配置しrpecを実行  
例：`rspec spec/experiments/string_spec.rb`

specディレクトリ配下全てのspecファイルを実行  
`rspec spec`


ルーティング設定  
config/routes.rb

```
    # 職員向け
    namespace :staff do
        root 'top#index'
    end

    # 管理者向け
    namespace :admin do
        root 'top#index'
    end

    # 顧客向け
    namespace :customer do
        root 'top#index'
    end
```

コントローラとアクションの作成

```
rails g controller staff/top
rails g controller admin/top
rails g controller customer/top
```

アセットのプリコンパイル  
(public/assetsディレクトリにapp/assetsのjs,cssがマージされたものができる)

`rake assets:precompile`

サーバ起動  
`rails s`

本番用  
`rails s -e production`


