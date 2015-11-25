module GMOPaymentCarrier
  class Csv
    def initialize(csv_row)
      @csv_row = csv_row
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
