module GMOPaymentCarrier
  class Converter
    def self.encode(api_kind:, query_string:)
      klass =
        if Const::AU::API_KINDS.include?(api_kind)
          GMOPaymentCarrier::AU::Parameter
        end

      klass.new(api_kind).tap do |result|
        parse_query(query_string).each do |k, v|
          result.send("#{Const::PARAM_NAMES_INVERTED[k]}=", v)
        end
      end
    end

    def self.decode(parameter)
      {}.tap do |result|
        parameter.class.attribute_names.each do |attribute_name|
          key = Const::PARAM_NAMES[attribute_name]
          next if key.blank?

          value = parameter.send(attribute_name)
          next if value.blank?

          result[key] = value.is_a?(String) ? value.encode('Shift_JIS') : value
        end
      end
    end

    def self.parse_query(query_string)
      URI::decode_www_form(query_string).to_h.with_indifferent_access
    end
    private_class_method :parse_query
  end
end
