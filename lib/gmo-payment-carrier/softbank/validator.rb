module GMOPaymentCarrier
  module SoftBank
    class Validator < GMOPaymentCarrier::Validator
      def validate(record)
        case record.api_kind
        when GMOPaymentCarrier::Const::SoftBank::API_KIND_ENTRY
          validate_entry(record)
        when GMOPaymentCarrier::Const::SoftBank::API_KIND_EXEC
          validate_exec(record)
        when GMOPaymentCarrier::Const::SoftBank::API_KIND_CANCEL
          validate_cancel(record)
        else
          raise GMOPaymentCarrier::ValidationError.new("It is unexpected api_kind. api_kind=#{record.api_kind}")
        end
      end

      private

        def validate_entry(record)
          validate_presence(
            record,
            [
              :shop_id,
              :shop_pass,
              :order_id,
              :amount
            ]
          )
        end

        def validate_exec(record)
          validate_presence(
            record,
            [
              :shop_id,
              :shop_pass,
              :access_id,
              :access_pass,
              :order_id,
              :ret_url,
              :charge_day,
              :first_month_free_flag
            ]
          )
        end

        def validate_cancel(record)
          validate_presence(
            record,
            [
              :shop_id,
              :shop_pass,
              :access_id,
              :access_pass,
              :order_id
            ]
          )
        end
    end
  end
end
