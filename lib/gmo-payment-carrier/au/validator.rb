module GMOPaymentCarrier
  module AU
    class Validator < GMOPaymentCarrier::Validator
      def validate(record)
        case record.api_kind
        when :entry_tran_au_continuance
          validate_entry_tran_au_continuance(record)
        when :exec_tran_au_continuance
          validate_exec_tran_au_continuance(record)
        when :au_continuance_cancel
          validate_au_continuance_cancel(record)
        end
      end

      private

        def validate_entry_tran_au_continuance(record)
          validate_presence(
            record,
            [
              :shop_id,
              :shop_pass,
              :order_id,
              :amount,
              :first_amount
            ]
          )
        end

        def validate_exec_tran_au_continuance(record)
          validate_presence(
            record,
            [
              :shop_id,
              :shop_pass,
              :access_id,
              :access_pass,
              :order_id,
              :account_timing_kbn,
              :account_timing,
              :first_account_date,
              :ret_url,
              :service_name
            ]
          )
        end

        def validate_au_continuance_cancel(record)
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
