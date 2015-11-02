module GMOPaymentCarrier
  module AU
    class Validator < ActiveModel::Validator
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
          if record.shop_id.blank?
            record.errors[:shop_id] << "can't be blank shop_id"
          end
          if record.shop_pass.blank?
            record.errors[:shop_pass] << "can't be blank shop_pass"
          end
          if record.order_id.blank?
            record.errors[:order_id] << "can't be blank order_id"
          end
          if record.amount.blank?
            record.errors[:order_id] << "can't be blank amount"
          end
          if record.first_amount.blank?
            record.errors[:order_id] << "can't be blank first_amount"
          end
        end

        def validate_exec_tran_au_continuance(record)
        end

        def validate_au_continuance_cancel(record)
        end
    end
  end
end
