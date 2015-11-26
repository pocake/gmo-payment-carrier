module GMOPaymentCarrier
  class Csv
    def initialize(csv_row)
      @csv_row = csv_row
    end

    def au?
      self.is_a?(GMOPaymentCarrier::AU::Csv)
    end

    def docomo?
      self.is_a?(GMOPaymentCarrier::Docomo::Csv)
    end

    def softbank?
      self.is_a?(GMOPaymentCarrier::SoftBank::Csv)
    end

    def self.genarate_attrs(attr_names)
      attr_names.each_with_index do |attr_name, i|
        define_method attr_name do
          @csv_row[i]
        end
      end
    end
  end
end
