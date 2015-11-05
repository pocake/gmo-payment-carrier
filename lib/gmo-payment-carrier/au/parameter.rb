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
          # 支払開始期限秒
          :payment_term_sec,
          # 表示サービス名
          :service_name,
          # 表示電話番号
          :service_tel,
          # 継続課金ID
          :aucontinu_accountid,
          # 支払方法
          :au_pay_method
        ]
      end

      attr_accessor(*(attribute_names + extension_attribute_names))

      def first_account_date
        @first_account_date.try(:strftime, '%Y%m%d')
      end
    end
  end
end
