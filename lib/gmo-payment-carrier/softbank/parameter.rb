module GMOPaymentCarrier
  module SoftBank
    class Parameter < GMOPaymentCarrier::Parameter
      validates_with Validator

      def self.extension_attribute_names
        [
          # 課金基準日
          :charge_day,
          # 初月無料フラグ
          :first_month_free_flag
        ]
      end

      attr_accessor(*attribute_names)
    end
  end
end
