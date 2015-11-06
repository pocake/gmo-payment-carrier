describe GMOPaymentCarrier::AU::Parameter do
  describe 'entry_tran_au_continuance' do
    let(:target) { GMOPaymentCarrier::AU::Parameter.new(GMOPaymentCarrier::AU::Const::API_KIND_ENTRY) }

    it 'entry_tran_au_continuance parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
      expect(target.errors[:amount].present?).to be true
      expect(target.errors[:first_amount].present?).to be true
    end

    it 'entry_tran_au_continuance parameter valid' do
      target.shop_id = 'dummmy shop_id'
      target.shop_pass = 'dummmy shop_pass'
      target.order_id = 'dummmy order_id'
      target.amount = 100
      target.first_amount = 100

      target.valid?

      expect(target.errors[:shop_id].blank?).to be true
      expect(target.errors[:shop_pass].blank?).to be true
      expect(target.errors[:order_id].blank?).to be true
      expect(target.errors[:amount].blank?).to be true
      expect(target.errors[:first_amount].blank?).to be true
    end
  end

  describe 'exec_tran_au_continuance' do
    let(:target) { GMOPaymentCarrier::AU::Parameter.new(GMOPaymentCarrier::AU::Const::API_KIND_EXEC) }

    it 'exec_tran_au_continuance parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:access_id].present?).to be true
      expect(target.errors[:access_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
      expect(target.errors[:account_timing_kbn].present?).to be true
      expect(target.errors[:account_timing].present?).to be true
      expect(target.errors[:first_account_date].present?).to be true
      expect(target.errors[:ret_url].present?).to be true
      expect(target.errors[:service_name].present?).to be true
    end

    it 'exec_tran_au_continuance parameter valid' do
      target.shop_id = 'dummmy shop_id'
      target.shop_pass = 'dummmy shop_pass'
      target.access_id = 'dummmy access_id'
      target.access_pass = 'dummmy access_pass'
      target.order_id = 'dummmy order_id'
      target.account_timing_kbn = 'dummmy account_timing_kbn'
      target.account_timing = 'dummmy account_timing'
      target.first_account_date = Time.now
      target.ret_url = 'dummmy ret_url'
      target.service_name = 'dummmy service_name'

      target.valid?

      expect(target.errors[:shop_id].blank?).to be true
      expect(target.errors[:shop_pass].blank?).to be true
      expect(target.errors[:access_id].blank?).to be true
      expect(target.errors[:access_pass].blank?).to be true
      expect(target.errors[:order_id].blank?).to be true
      expect(target.errors[:account_timing_kbn].blank?).to be true
      expect(target.errors[:account_timing].blank?).to be true
      expect(target.errors[:first_account_date].blank?).to be true
      expect(target.errors[:ret_url].blank?).to be true
      expect(target.errors[:service_name].blank?).to be true
    end
  end

  describe 'au_continuance_cancel' do
    let(:target) { GMOPaymentCarrier::AU::Parameter.new(GMOPaymentCarrier::AU::Const::API_KIND_CANCEL) }

    it 'au_continuance_cancel parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:access_id].present?).to be true
      expect(target.errors[:access_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
    end

    it 'au_continuance_cancel parameter valid' do
      target.shop_id = 'dummmy shop_id'
      target.shop_pass = 'dummmy shop_pass'
      target.access_id = 'dummmy access_id'
      target.access_pass = 'dummmy access_pass'
      target.order_id = 'dummmy order_id'

      target.valid?

      expect(target.errors[:shop_id].blank?).to be true
      expect(target.errors[:shop_pass].blank?).to be true
      expect(target.errors[:access_id].blank?).to be true
      expect(target.errors[:access_pass].blank?).to be true
      expect(target.errors[:order_id].blank?).to be true
    end
  end
end
