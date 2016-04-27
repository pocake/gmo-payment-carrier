module GMOPaymentCarrier
  module Docomo
    class Parameter < GMOPaymentCarrier::Parameter
      validates_with Validator

      def self.extension_attribute_names
        [
          # ドコモ表示項目1
          :docomo_disp_1,
          # ドコモ表示項目2
          :docomo_disp_2,
          # 初月無料区分
          :first_month_free_flag,
          # 確定基準日
          :confirm_base_date,
          # 利用店舗名
          :disp_shop_name,
          # 連絡先電話番号
          :disp_phone_number,
          # メールアドレス
          :disp_mail_address,
          # 終了月無料区分
          :last_month_free_flag,
          # docomoキャンセル額
          :docomo_cancel_amount,
          # docomoキャンセル税
          :docomo_cancel_tax,
          # docomo決済コード
          :docomo_settlement_code
        ]
      end

      attr_accessor(*(attribute_names + extension_attribute_names))

      def pay_type
        Const::PAY_TYPE
      end
    end
  end
end
