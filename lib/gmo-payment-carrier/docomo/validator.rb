module GMOPaymentCarrier
  module Docomo
    class Validator < GMOPaymentCarrier::Validator
      def validate(record)
        case record.api_kind
        when Const::API_KIND_ENTRY
          validate_entry(record)
        when Const::API_KIND_EXEC
          validate_exec(record)
        when Const::API_KIND_CANCEL
          validate_cancel(record)
        when Const::API_KIND_SEARCH
          validate_search(record)
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
              :first_month_free_flag,
              :confirm_base_date
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

        def validate_search(record)
          validate_presence(
            record,
            [
              :shop_id,
              :shop_pass,
              :order_id,
              :pay_type
            ]
          )
        end
    end
  end
end
