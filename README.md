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

###環境準備関連

アプリ作成  
`rails new customermanagement -d mysql --skip-test-unit`

Gemファイルに書いたパッケージをインストール    
`bundle`

Gemパッケージリスト表示  
`bundle list`

database.ymlを元にDB作成  
`rake db:create`

###RSPEC

rpecインストール  
`rails g rspec:install`

rspec実行  

specディレクトリ配下に任意のディレクトリ・ファイルを配置しrpecを実行  
例：`rspec spec/experiments/string_spec.rb`

specディレクトリ配下全てのspecファイルを実行  
`rspec spec`

***

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
rails g controller errors
rails g controller staff/sessions
```

アセットのプリコンパイル  
(public/assetsディレクトリにapp/assetsのjs,cssがマージされたものができる)

`rake assets:precompile`

サーバ起動  
`rails s`

本番用  
`rails s -e production`

###マイグレーション

モデルに関する各種スケルトン作成  
`rails g model StaffMember`

スケルトン削除  
`rails destroy model StafffMember`

マイグレーション(db/migrate/以下のファイルを元にDB構造を変更)  
`rake db:migrate`

マイグレーションをリセット(DBを作成しなおし、マイグレーションファイルを実行)  
`rake db:migrate:reset`

マイグレーションファイル(db/migrate/yyyymmddhhmmss_create_staff_members.rb)

```
class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
      t.string :email,            null: false # メールアドレス
      t.string :email_for_index,  null: false # 索引用メールアドレス
      t.string :family_name,      null: false # 姓
      t.string :given_name,       null: false # 名
      t.string :family_name_kana, null: false # 姓(カナ)
      t.string :given_name_kana,  null: false # 名(カナ)
      t.string :hashed_password               # パスワード
      t.date   :start_date,       null: false # 開始日
      t.date   :end_date                      # 終了日
      t.boolean :suspended, null: false, default: false # 停止フラグ
      t.timestamps
    end
    add_index :staff_members, :email_for_index, unique: true
    add_index :staff_members, [:family_name_kana, :given_name_kana]
  end
end
```

実際に作成されるDB

```
mysql> desc staff_members;
+------------------+--------------+------+-----+---------+----------------+
| Field            | Type         | Null | Key | Default | Extra          |
+------------------+--------------+------+-----+---------+----------------+
| id               | int(11)      | NO   | PRI | NULL    | auto_increment |
| email            | varchar(255) | NO   |     | NULL    |                |
| email_for_index  | varchar(255) | NO   | UNI | NULL    |                |
| family_name      | varchar(255) | NO   |     | NULL    |                |
| given_name       | varchar(255) | NO   |     | NULL    |                |
| family_name_kana | varchar(255) | NO   | MUL | NULL    |                |
| given_name_kana  | varchar(255) | NO   |     | NULL    |                |
| hashed_password  | varchar(255) | YES  |     | NULL    |                |
| start_date       | date         | NO   |     | NULL    |                |
| end_date         | date         | YES  |     | NULL    |                |
| suspended        | tinyint(1)   | NO   |     | 0       |                |
| created_at       | datetime     | YES  |     | NULL    |                |
| updated_at       | datetime     | YES  |     | NULL    |                |
+------------------+--------------+------+-----+---------+----------------+
```

###シードデータ投入
db/seeds/以下のファイルを元にシードデータ投入  

`rake db:seed`


データベースを作り直しシードデータ投入  

`rake db:reset`

###コントローラ




