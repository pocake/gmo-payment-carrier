module GMOPaymentCarrier
  class Converter
    def self.encode(klass:, query_string:)
      params = parse_query(query_string)
      klass.new.tap do |parameter|
        params.each do |k, v|
          parameter.send("#{Const::PARAM_NAMES_INVERTED[k]}=", v)
        end
      end
    end

    def self.decode(parameter)
      {}.tap do |hash|
        parameter.class.attribute_names.each do |attribute_name|
          key = Const::PARAM_NAMES[attribute_name]
          next if key.blank?

          value = parameter.send(attribute_name)
          next if value.blank?

          hash[key] = value.is_a?(String) ? value.encode('Shift_JIS') : value
        end
      end
    end

    def self.parse_query(query_string)
      query_string.split('&').map{ |str| str.split('=') }.to_h.symbolize_keys
    end
    private_class_method :parse_query
  end
end
