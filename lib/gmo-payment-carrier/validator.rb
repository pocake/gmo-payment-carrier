module GMOPaymentCarrier
  class Validator < ActiveModel::Validator
    def validate_presence(record, param_names)
      param_names.each do |param_name|
        next if record.send(param_name).present?

        record.errors[param_name] << "can't be blank #{param_name.to_s}"
      end
    end
  end
end
