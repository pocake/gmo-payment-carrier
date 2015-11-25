module GMOPaymentCarrier
  class CsvParser
    def self.parse(filepath)
      CSV.table(filepath).each do |row|
        # Note: footerに達したら処理終了
        break if row[0] == 'FT'

        csv =
          if File.basename(filepath).start_with?('AU')
            GMOPaymentCarrier::AU::Csv.new(row)
          elsif File.basename(filepath).start_with?('R')
            GMOPaymentCarrier::Docomo::Csv.new(row)
          elsif File.basename(filepath).start_with?('SB_S')
            GMOPaymentCarrier::SoftBank::Csv.new(row)
          end
        raise "Failed to matching csv file. file path: #{filepath}" unless csv

        yield(csv)
      end
    end
  end
end
