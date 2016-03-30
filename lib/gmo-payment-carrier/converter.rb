module GMOPaymentCarrier
  class Converter
    def self.encode(mapping_klass:, query_string:)
      mapping_klass.new.tap do |result|
        parse_query(query_string).each do |k, v|
          next unless Const::PARAM_NAMES_INVERTED.has_key?(k)
          result.send("#{Const::PARAM_NAMES_INVERTED[k]}=", v)
        end
      end
    end

    def self.encode_for_params(params)
      Hashie::Mash.new.tap do |result|
        params.each do |k, v|
          next unless Const::PARAM_NAMES_INVERTED.has_key?(k)
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
      query_string.split('&').map { |str|
        key_value_pair = str.split('=')
        next unless key_value_pair.length == 2
        key_value_pair
      }.compact.to_h.with_indifferent_access
    end
    private_class_method :parse_query
  end
end
