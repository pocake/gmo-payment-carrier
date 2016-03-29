GMOPaymentCarrier
==============================

[![Circle CI](https://circleci.com/gh/pocake/gmo-payment-carrier.svg?style=svg)](https://circleci.com/gh/pocake/gmo-payment-carrier)
![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)
[![CodeClimate](https://codeclimate.com/github/pocake/gmo-payment-carrier/badges/gpa.svg)](https://codeclimate.com/github/pocake/gmo-payment-carrier)
[![TestCoverage](https://codeclimate.com/github/pocake/gmo-payment-carrier/badges/coverage.svg)](https://codeclimate.com/github/pocake/gmo-payment-carrier/coverage)
[![Dependency Status](https://gemnasium.com/pocake/gmo-payment-carrier.svg)](https://gemnasium.com/pocake/gmo-payment-carrier)



## Installation

TODO


## Support

現状サポートしているAPIは以下となります。

- auかんたん決済継続課金
  - [取引登録 (/payment/EntryTranAuContinuance.idPass)](#auかんたん決済継続課金取引登録)
  - [決済実行 (/payment/EntryTranAuContinuance.idPass)](#auかんたん決済継続課金決済実行)
  - [継続課金解約 (/payment/AuContinuanceCancel.idPass)](#auかんたん決済継続課金継続課金解約)
  - [取引状態参照 (/payment/SearchTradeMulti.idPass)](#auかんたん決済継続課金取引状態参照)
- ドコモ継続課金サービス決済
  - [取引登録 (/payment/EntryTranDocomoContinuance.idPass)](#ドコモ継続課金サービス決済取引登録)
  - [決済実行 (/payment/ExecTranDocomoContinuance.idPass)](#ドコモ継続課金サービス決済決済実行)
  - [継続課金終了(利用者) (/payment/DocomoContinuanceUserEnd.idPass)](#ドコモ継続課金サービス決済継続課金終了利用者)
  - [取引状態参照 (/payment/SearchTradeMulti.idPass)](#ドコモ継続課金サービス取引状態参照)
- ソフトバンクまとめて支払い(B)継続課金決済
  - [取引登録 (/payment/EntryTranSbContinuance.idPass)](#ソフトバンクまとめて支払いB継続課金決済取引登録)
  - [決済実行 (/payment/ExecTranSbContinuance.idPass)](#ソフトバンクまとめて支払いB継続課金決済決済実行)
  - [継続課金解約 (/payment/SbContinuanceCancel.idPass)](#ソフトバンクまとめて支払いB継続課金決済継続課金解)
  - [取引状態参照 (/payment/SearchTradeMulti.idPass)](#ソフトバンクまとめて支払いB継続課金取引状態参照)

また、以下のユーティリティな部品を用意してます
- [各キャリアの課金結果ファイル(CSV)パーサー](#各キャリアの課金結果ファイルCSVパーサー)
- RSpec Stub
  - [auかんたん決済継続課金#取引登録#正常](#auかんたん決済継続課金取引登録正常)
  - [auかんたん決済継続課金#決済実行#正常](#auかんたん決済継続課金決済実行正常)
  - [auかんたん決済継続課金#継続課金解約#正常](#auかんたん決済継続課金継続課金解約正常)
  - [ドコモ継続課金サービス決済#継続課金解約#正常](#ドコモ継続課金サービス決済継続課金解約正常)
  - [ドコモ継続課金サービス決済#決済実行#正常](#ドコモ継続課金サービス決済決済実行正常)
  - [ドコモ継続課金サービス決済#継続課金終了(利用者)#正常](#ドコモ継続課金サービス決済継続課金終了利用者正常)
  - [ソフトバンクまとめて支払い(B)継続課金決済#取引登録#正常](#ソフトバンクまとめて支払いB継続課金決済取引登録正常)
  - [ソフトバンクまとめて支払い(B)継続課金決済#決済実行#正常](#ソフトバンクまとめて支払いB継続課金決済決済実行正常)
  - [ソフトバンクまとめて支払い(B)継続課金決済#継続課金解約#正常](#ソフトバンクまとめて支払いB継続課金決済継続課金解約正常)
  - [キャリア決済継続課金共通#異常](#キャリア決済継続課金共通異常)

## Usage

### 準備

```ruby
# for test
client = GMOPaymentCarrier::Client.new(env: :test)

# for production
client = GMOPaymentCarrier::Client.new(env :production)
```

### auかんたん決済継続課金#取引登録

##### Input
| パラメータ名 | 必須 |
|:-------------|:-----|
| shop_id      | ○    |
| shop_pass    | ○    |
| order_id     | ○    |
| amount       | ○    |
| tax          | ×    |
| first_amount | ○    |
| access_id    | ×    |

##### Output
- access_id
- access_pass

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) auかんたん決済継続課金インターフェース仕様」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::AU::Parameter.new(api_kind: GMOPaymentCarrier::AU::Const::API_KIND_ENTRY)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.order_id = 'dummmy order_id'
param.amount = 500
param.first_amount = 500

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### auかんたん決済継続課金#決済実行

##### Input
| パラメータ名       | 必須 |
|:-------------------|:-----|
| shop_id            | ○    |
| shop_pass          | ○    |
| access_id          | ○    |
| access_pass        | ○    |
| order_id           | ○    |
| site_id            | ●    |
| site_pass          | ●    |
| member_id          | ●    |
| member_name        | ●    |
| create_member      | ●    |
| client_field1      | ×    |
| client_field2      | ×    |
| client_field3      | ×    |
| commodity          | ○    |
| account_timing_kbn | ○    |
| account_timing     | ○    |
| first_account_date | ○    |
| ret_url            | ○    |
| payment_term_sec   | ×    |
| service_name       | ○    |
| service_tel        | ○    |

##### Output
- access_id
- token
- start_url
- start_limit_date

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) auかんたん決済継続課金インターフェース仕様」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::AU::Parameter.new(api_kind: GMOPaymentCarrier::AU::Const::API_KIND_EXEC)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.access_id = 'dummmy access_id'
param.access_pass = 'dummmy access_pass'
param.order_id = 'dummmy order_id'
param.commodity = 'commodity'
param.account_timing_kbn = 'account_timing_kbn'
param.account_timing = 'account_timing'
param.first_account_date = 'first_account_date'
param.ret_url = 'ret_url'
param.service_name = 'service_name'
param.service_tel = 'service_tel'

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### auかんたん決済継続課金#継続課金解約

##### Input
| パラメータ名 | 必須 |
|:-------------|:-----|
| shop_id      | ○    |
| shop_pass    | ○    |
| access_id    | ○    |
| access_pass  | ○    |
| order_id     | ○    |


##### Output
order_id
status

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) auかんたん決済継続課金インターフェース仕様」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::AU::Parameter.new(api_kind: GMOPaymentCarrier::AU::Const::API_KIND_CANCEL)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.access_id = 'dummmy access_id'
param.access_pass = 'dummmy access_pass'
param.order_id = 'dummmy order_id'

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### auかんたん決済継続課金#取引状態参照

##### Input
| パラメータ名 | 必須 |
|:-------------|:-----|
| shop_id      | ○    |
| shop_pass    | ○    |
| access_id    | ○    |
| access_pass  | ○    |
| order_id     | ○    |


##### Output
- - status
- - process_date
- - job_cd
- - access_id
- - access_pass
- - amount
- - tax
- - currency
- - site_id
- - member_id
- - client_field_1
- - client_field_2
- - client_field_3
- - pay_type
- - au_pay_method
- - account_timing_kbn
- - account_timing
- - first_account_date
- - first_amount
- - first_tax
- - au_continuance_err_code
- - au_continuance_err_info
- - au_continue_account_id
- - err_code
- - err_info

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) 決済結果を参照する」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::AU::Parameter.new(api_kind: GMOPaymentCarrier::AU::Const::API_KIND_SEARCH)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.access_id = 'dummmy access_id'
param.access_pass = 'dummmy access_pass'
param.order_id = 'dummmy order_id'

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### ドコモ継続課金サービス決済#取引登録

##### Input
| パラメータ名 | 必須 |
|:-------------|:-----|
| shop_id      | ○    |
| shop_pass    | ○    |
| order_id     | ○    |
| amount       | ○    |
| tax          | ×    |

##### Output
- access_id
- access_pass

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) ドコモ継続課金サービス決済インターフェース仕様」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::Docomo::Parameter.new(api_kind: GMOPaymentCarrier::Docomo::Const::API_KIND_ENTRY)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.order_id = 'dummmy order_id'
param.amount = 500

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### ドコモ継続課金サービス決済#決済実行

##### Input
| パラメータ名          | 必須 |
|:----------------------|:-----|
| shop_id               | ○    |
| shop_pass             | ○    |
| access_id             | ○    |
| access_pass           | ○    |
| order_id              | ○    |
| client_field1         | ×    |
| client_field2         | ×    |
| client_field3         | ×    |
| docomo_disp1          | ×    |
| docomo_disp2          | ×    |
| ret_url               | ○    |
| payment_term_sec      | ×    |
| first_month_free_flag | ○    |
| confirm_base_date     | ○    |
| disp_shop_name        | ×    |
| disp_phone_number     | ×    |
| disp_mail_address     | ×    |

##### Output
- access_id
- token
- start_url
- start_limit_date

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) ドコモ継続課金サービス決済インターフェース仕様」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::AU::Parameter.new(api_kind: GMOPaymentCarrier::AU::Const::API_KIND_EXEC)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.access_id = 'dummmy access_id'
param.access_pass = 'dummmy access_pass'
param.order_id = 'dummmy order_id'
param.ret_url = 'ret_url'
param.first_month_free_flag = 'first_month_free_flag'
param.confirm_base_date = 'confirm_base_date'

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### ドコモ継続課金サービス決済#継続課金終了(利用者)

##### Input
| パラメータ名         | 必須 |
|:---------------------|:-----|
| shop_id              | ○    |
| shop_pass            | ○    |
| access_id            | ○    |
| access_pass          | ○    |
| order_id             | ○    |
| amount               | ○    |
| tax                  | ×    |
| docomo_disp1         | ×    |
| ret_url              | ×    |
| payment_term_sec     | ×    |
| last_month_free_flag | ○    |

##### Output
access_id
token
start_url
start_limit_date

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) ドコモ継続課金サービス決済インターフェース仕様」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::AU::Parameter.new(api_kind: GMOPaymentCarrier::AU::Const::API_KIND_CANCEL)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.access_id = 'dummmy access_id'
param.access_pass = 'dummmy access_pass'
param.order_id = 'dummmy order_id'
param.amount = 500
param.last_month_free_flag = 1

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### auかんたん決済継続課金#取引状態参照

##### Input
| パラメータ名 | 必須 |
|:-------------|:-----|
| shop_id      | ○    |
| shop_pass    | ○    |
| access_id    | ○    |
| access_pass  | ○    |
| order_id     | ○    |


##### Output
- status
- process_date
- job_cd
- access_id
- access_pass
- amount
- tax
- currency
- site_id
- member_id
- client_field_1
- client_field_2
- client_field_3
- pay_type
- err_code
- err_info
- docomo_settlement_code
- docomo_cancel_amount
- docomo_cancel_tax

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) 決済結果を参照する」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::Docomo::Parameter.new(api_kind: GMOPaymentCarrier::Docomo::Const::API_KIND_SEARCH)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.access_id = 'dummmy access_id'
param.access_pass = 'dummmy access_pass'
param.order_id = 'dummmy order_id'

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### ソフトバンクまとめて支払い(B)継続課金決済#取引登録

##### Input
| パラメータ名 | 必須 |
|:-------------|:-----|
| shop_id      | ○    |
| shop_pass    | ○    |
| order_id     | ○    |
| amount       | ○    |
| tax          | ×    |

##### Output
- access_id
- access_pass

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) ソフトバンクまとめて支払い(B)継続課金決済インターフェース仕様」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::SoftBank::Parameter.new(api_kind: GMOPaymentCarrier::SoftBank::Const::API_KIND_ENTRY)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.order_id = 'dummmy order_id'
param.amount = 500

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### ソフトバンクまとめて支払い(B)継続課金決済#決済実行

##### Input
| パラメータ名          | 必須 |
|:----------------------|:-----|
| shop_id               | ○    |
| shop_pass             | ○    |
| access_id             | ○    |
| access_pass           | ○    |
| order_id              | ○    |
| client_field1         | ×    |
| client_field2         | ×    |
| client_field3         | ×    |
| ret_url               | ○    |
| payment_term_sec      | ×    |
| charge_day            | ×    |
| first_month_free_flag | ○    |

##### Output
- access_id
- token
- start_url
- start_limit_date

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) ソフトバンクまとめて支払い(B)継続課金決済インターフェース仕様」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::AU::Parameter.new(api_kind: GMOPaymentCarrier::AU::Const::API_KIND_EXEC)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.access_id = 'dummmy access_id'
param.access_pass = 'dummmy access_pass'
param.order_id = 'dummmy order_id'
param.ret_url = 'ret_url'
param.first_month_free_flag = GMOPaymentCarrier::SoftBank::FIRST_MONTH_FREE_FLAG_ON

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### ソフトバンクまとめて支払い(B)継続課金決済#継続課金解約

##### Input
| パラメータ名 | 必須 |
|:-------------|:-----|
| shop_id      | ○    |
| shop_pass    | ○    |
| access_id    | ○    |
| access_pass  | ○    |
| order_id     | ○    |

##### Output
- order_id
- status

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) ソフトバンクまとめて支払い(B)継続課金決済インターフェース仕様」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::SoftBank::Parameter.new(api_kind: GMOPaymentCarrier::SoftBank::Const::API_KIND_CANCEL)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.access_id = 'dummmy access_id'
param.access_pass = 'dummmy access_pass'
param.order_id = 'dummmy order_id'

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### ソフトバンクまとめて支払い(B)継続課金決済#取引状態参照

##### Input
| パラメータ名 | 必須 |
|:-------------|:-----|
| shop_id      | ○    |
| shop_pass    | ○    |
| access_id    | ○    |
| access_pass  | ○    |
| order_id     | ○    |


##### Output
- - status
- - process_date
- - job_cd
- - access_id
- - access_pass
- - amount
- - tax
- - currency
- - site_id
- - member_id
- - client_field_1
- - client_field_2
- - client_field_3
- - pay_type
- - payment_term
- - err_code
- - err_info
- - sb_tracking_id
- - sb_start_charge_month

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) 決済結果を参照する」を参照のこと

##### Example

```ruby
param = GMOPaymentCarrier::SoftBank::Parameter.new(api_kind: GMOPaymentCarrier::SoftBank::Const::API_KIND_SEARCH)
param.shop_id = 'dummmy shop_id'
param.shop_pass = 'dummmy shop_pass'
param.access_id = 'dummmy access_id'
param.access_pass = 'dummmy access_pass'
param.order_id = 'dummmy order_id'

if param.valid?
  client.call_api(param)
else
  # エラー処理
end
```

### 各キャリアの課金結果ファイル(CSV)パーサー

##### キャリア別Output

**AU**

| パラメータ名                  | 和名             | 必須 |
|:------------------------------|:-----------------|:-----|
| shop_id                       | ショップID       | ○    |
| order_id                      | オーダーID       | ○    |
| billing_confirmed_date        | 課金確認日       | ○    |
| billing_date                  | 課金日           | ○    |
| status                        | 取引状態         | ○    |
| amount                        | 利用金額         | ○    |
| tax                           | 税送料           | ○    |
| aucontinu_accountid           | au継続課金ID     | ○    |
| au_payment_information_number | au決済情報番号   | ×    |
| tran_id                       | 取引ID           | ○    |
| au_merchant_management_number | au加盟店管理番号 | ○    |
| err_code                      | エラーコード     | ×    |
| err_info                      | エラー詳細コード | ×    |
| tran_date                     | 処理日時         | ○    |

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) 10.5.2. 課金結果ファイルを送信する流れ」を参照のこと

**Docomo**

| パラメータ名                 | 和名                 | 必須 |
|:-----------------------------|:---------------------|:-----|
| shop_id                      | ショップID           | ○    |
| order_id                     | オーダID             | ○    |
| status                       | 取引状態             | ○    |
| amount                       | 利用金額             | ○    |
| tax                          | 税送料               | ○    |
| change_amount                | 変更利用金額         | ×    |
| change_tax                   | 変更税送料           | ×    |
| docomo_disp_1                | ドコモ表示項目1      | ×    |
| docomo_disp_2                | ドコモ表示項目2      | ×    |
| docomo_settlement_code       | ドコモ決済番号       | ○    |
| client_field_1               | 加盟店自由項目1      | ×    |
| client_field_2               | 加盟店自由項目2      | ×    |
| client_field_3               | 加盟店自由項目3      | ×    |
| tran_id                      | 取引ID               | ○    |
| tran_pass                    | 取引パスワード       | ○    |
| tran_id                      | 取引ID               | ○    |
| docomo_merchant_order_number | ドコモ加盟店注文番号 | ○    |
| docomo_terminal_segment      | ドコモ端末区分       | ○    |
| wifi_tethering_connection    | Wi-fiテザリング接続  | ○    |
| confirm_base_date            | 確定基準日           | ○    |
| first_month_free_flag        | 初月無料フラグ       | ○    |
| end_month_free_flag          | 終了月無料フラグ     | ×    |
| continue_billing_end_date    | 継続課金終了日       | ×    |
| err_code                     | エラーコード         | ×    |
| err_info                     | エラー詳細コード     | ×    |
| tran_date                    | 処理日時             | ○    |

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) 12.7.2. 申込状況ファイルを送信する流れ」を参照のこと

**SoftBank**

| パラメータ名   | 和名                           | 必須 |
|:---------------|:-------------------------------|:-----|
| shop_id        | ショップID                     | ○    |
| order_id       | オーダID                       | ○    |
| charge_day     | 課金日                         | ○    |
| status         | 取引状態                       | ○    |
| amount         | 利用金額                       | ○    |
| tax            | 税送料                         | ○    |
| sb_tracking_id | ソフトバンク処理トラッキングID | ×    |
| err_code       | エラーコード                   | ×    |
| err_info       | エラー詳細コード               | ×    |
| tran_date      | 処理日時                       | ○    |

※詳細は最新版の「プロトコルタイプ(マルチ決済インターフェース仕様) 23.4.2. 課金結果ファイルを送信する流れ」を参照のこと

##### Example

```ruby
rows = []
GMOPaymentCarrier::CsvParser.parse(filepath) do |row|
  rows << row
end
```

### RSpecHelper

##### 設定

```
RSpec.configure do |config|
  config.include GMOPaymentCarrier::RSpecHelper
end
```

##### auかんたん決済継続課金#取引登録#正常

```ruby
describe 'hen au entry normality' do
  before do
    set_au_entry_normality_stub
  end

  it "should success" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```

##### auかんたん決済継続課金#決済実行#正常

```ruby
describe 'when au exec normality' do
  before do
    set_au_exec_normality_stub
  end

  it "should success" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```

##### auかんたん決済継続課金#継続課金解約#正常

```ruby
describe 'when au cencel normality' do
  before do
    set_au_cancel_normality_stub
  end

  it "should success" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```

##### ドコモ継続課金サービス決済#継続課金解約#正常

```ruby
describe 'when docomo entry normality' do
  before do
    set_docomo_entry_normality_stub
  end

  it "should success" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```

##### ドコモ継続課金サービス決済#決済実行#正常

```ruby
describe 'when docomo exec normality' do
  before do
    set_docomo_exec_normality_stub
  end

  it "should success" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```

##### ドコモ継続課金サービス決済#継続課金終了(利用者)#正常

```ruby
describe 'when docomo cancel normality' do
  before do
    set_docomo_cancel_normality_stub
  end

  it "should success" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```

##### ソフトバンクまとめて支払い(B)継続課金決済#取引登録#正常

```ruby
describe 'when softbank entry normality' do
  before do
    set_sb_entry_normality_stub
  end

  it "should success" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```

##### ソフトバンクまとめて支払い(B)継続課金決済#決済実行#正常

```ruby
describe 'when softbank exec normality' do
  before do
    set_sb_exec_normality_stub
  end

  it "should success" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```

##### ソフトバンクまとめて支払い(B)継続課金決済#継続課金解約#正常

```ruby
describe 'when softbank cencel normality' do
  before do
    set_sb_cencel_normality_stub
  end

  it "should success" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```

##### キャリア決済継続課金共通#異常

```ruby
describe 'when softbank cencel normality' do
  before do
    set_gmo_raise_error_stub
  end

  it "should fail" do
    GMOPaymentCarrier::Client.new.call_api(nil)
  end
end
```
