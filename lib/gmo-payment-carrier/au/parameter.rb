module GMOPaymentCarrier
  module AU
    class Parameter < GMOPaymentCarrier::Parameter
      validates_with Validator

      def self.extension_attribute_names
        [
          # サイトID
          :site_id,
          # サイトパスワード
          :site_pass,
          # 会員作成フラグ
          :create_member,
          # 初回課金利用金額
          :first_amount,
          # 初回課金税送料
          :first_tax,
          # 会員作成フラグ
          :create_member,
          # 摘要
          :commodity,
          # 課金タイミング区分
          :account_timing_kbn,
          # 課金タイミング
          :account_timing,
          # 初回課金日
          :first_account_date,
          # 表示サービス名
          :service_name,
          # 表示電話番号
          :service_tel,
          # 継続課金ID
          :aucontinu_accountid,
          # 支払方法
          :au_pay_method,
          # auエラーコード
          :au_continuance_err_code,
          # auエラー情報
          :au_continuance_err_info,
          # auアカウントID
          :au_continue_account_id
        ]
      end

      attr_accessor(*attribute_names)

      def first_account_date
        @first_account_date.try(:strftime, '%Y%m%d')
      end

      def pay_type
        Const::PAY_TYPE
      end
    end
  end
end
