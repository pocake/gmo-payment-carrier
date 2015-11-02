module GMOPaymentCarrier
  module AU
    class Parameter
      include ActiveModel::Model
      validates_with GMOPaymentCarrier::AU::Validator

      def self.attribute_names
      [
        # API種別
        :api_kind,
        # バージョン
        :version,
        # ショップID
        :shop_id,
        # ショップパスワード
        :shop_pass,
        # オーダーID
        :order_id,
        # 課金利用金額
        :amount,
        # 課金税送料
        :tax,
        # 初回課金利用金額
        :first_amount,
        # 初回課金税送料
        :first_tax,
        # 取引ID
        :access_id,
        # 取引パスワード
        :access_pass,
        # サイトID
        :site_id,
        # サイトパスワード
        :site_pass,
        # 会員ID
        :member_id,
        # 会員名
        :member_name,
        # 会員作成フラグ
        :create_member,
        # 加盟店自由項目1
        :client_field_1,
        # 加盟店自由項目2
        :client_Field_2,
        # 加盟店自由項目3
        :client_Field_3,
        # 摘要
        :commodity,
        # 課金タイミング区分
        :account_timing_kbn,
        # 課金タイミング
        :account_timing,
        # 初回課金日
        :first_account_date,
        # 決済結果戻しURL
        :ret_url,
        # 支払開始期限秒
        :payment_term_sec,
        # 表示サービス名
        :service_name,
        # 表示電話番号
        :service_tel,
        # 現状態
        :status,
        # 処理日時
        :tran_date,
        # 継続課金ID
        :aucontinu_accountid,
        # 支払方法
        :au_pay_method,
        # エラーコード
        :err_code,
        # エラー詳細コード
        :err_info
      ]
      end

      attr_accessor(*attribute_names)

      def exists_error?
        self.err_code.present?
      end
    end
  end
end
