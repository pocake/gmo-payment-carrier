module GMOPaymentCarrier
  module SoftBank
    class Parameter < GMOPaymentCarrier::Parameter
      validates_with Validator

      def self.extension_attribute_names
        [
          # 課金基準日
          :charge_day,
          # 初月無料フラグ
          :first_month_free_flag,
          # SBトラッッキングID
          :sb_tracking_id,
          # 課金開始月
          :sb_start_charge_month
        ]
      end

      attr_accessor(*attribute_names)

      # 支払い区分
      def pay_type
        Const::PAY_TYPE
      end
    end
  end
end
