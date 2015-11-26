describe GMOPaymentCarrier::CsvParser do
  describe '#parse' do
    let(:current_path) { File.expand_path(File.dirname(__FILE__)) }

    context 'carrier au' do
      let(:filepath) { File.expand_path('../fixtures/AU_C_tshopxxxx_yyyymmdd.csv', current_path) }

      it 'success parce' do
        GMOPaymentCarrier::CsvParser.parse(filepath) do |csv|
          expect(csv.shop_id.present?).to be true
          expect(csv.order_id.present?).to be true
          expect(csv.billing_confirmed_date.present?).to be true
          expect(csv.billing_date.present?).to be true
          expect(csv.status.present?).to be true
          expect(csv.amount.present?).to be true
          expect(csv.tax.present?).to be true
          expect(csv.aucontinu_accountid.present?).to be true
          expect(csv.au_payment_information_number.present?).to be true
          expect(csv.tran_id.present?).to be true
          expect(csv.au_merchant_management_number.present?).to be true
          expect(csv.tran_date.present?).to be true
        end
      end
    end

    context 'carrier docomo' do
      let(:filepath) { File.expand_path('../fixtures/R_tshopxxxx_yyyymmdd.csv', current_path) }

      it 'success parce' do
        GMOPaymentCarrier::CsvParser.parse(filepath) do |csv|
          expect(csv.shop_id.present?).to be true
          expect(csv.order_id.present?).to be true
          expect(csv.status.present?).to be true
          expect(csv.amount.present?).to be true
          expect(csv.tax.present?).to be true
          expect(csv.change_amount.blank?).to be true
          expect(csv.change_tax.blank?).to be true
          expect(csv.docomo_disp_1.present?).to be true
          expect(csv.docomo_disp_2.present?).to be true
          expect(csv.docomo_settlement_code.present?).to be true
          expect(csv.client_field_1.present?).to be true
          expect(csv.client_field_2.present?).to be true
          expect(csv.client_field_3.present?).to be true
          expect(csv.tran_id.present?).to be true
          expect(csv.tran_pass.present?).to be true
          expect(csv.docomo_merchant_order_number.present?).to be true
          expect(csv.docomo_terminal_segment.present?).to be true
          expect(csv.wifi_tethering_connection.present?).to be true
          expect(csv.confirm_base_date.present?).to be true
          expect(csv.first_month_free_flag.present?).to be true
          expect(csv.end_month_free_flag.present?).to be true
          expect(csv.continue_billing_end_date.present?).to be true
          expect(csv.err_code.blank?).to be true
          expect(csv.err_info.blank?).to be true
          expect(csv.tran_date.present?).to be true
        end
      end
    end

    context 'carrier softbank' do
      let(:filepath) { File.expand_path('../fixtures/SB_S_tshopxxxx_yyyymmdd.csv', current_path) }

      it 'success parce' do
        GMOPaymentCarrier::CsvParser.parse(filepath) do |csv|
          expect(csv.shop_id.present?).to be true
          expect(csv.order_id.present?).to be true
        end
      end
    end
  end
end
