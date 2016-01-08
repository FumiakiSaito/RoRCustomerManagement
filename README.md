# RoRCustomerManagement

共有ディレクトリ

ホストOS ↔ ゲストOS  
/Develop/GitHub_FumiakiSaito/RoRCustomerManagement/Vagrant ↔ /vagrant

サーバ起動  
`vagrant up`

接続  
`vagrant ssh`

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
