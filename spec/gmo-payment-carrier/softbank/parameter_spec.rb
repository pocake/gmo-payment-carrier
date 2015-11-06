describe GMOPaymentCarrier::AU::Parameter do
  describe 'entry_tran_softbank_continuance' do
    let(:target) { GMOPaymentCarrier::SoftBank::Parameter.new(GMOPaymentCarrier::SoftBank::Const::API_KIND_ENTRY) }

    it 'entry_tran_softbank_continuance parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
      expect(target.errors[:amount].present?).to be true
    end

    it 'entry_tran_softbank_continuance parameter valid' do
      target.shop_id = 'dummmy shop_id'
      target.shop_pass = 'dummmy shop_pass'
      target.order_id = 'dummmy order_id'
      target.amount = 100

      target.valid?

      expect(target.errors[:shop_id].blank?).to be true
      expect(target.errors[:shop_pass].blank?).to be true
      expect(target.errors[:order_id].blank?).to be true
      expect(target.errors[:amount].blank?).to be true
    end
  end

  describe 'exec_tran_softbank_continuance' do
    let(:target) { GMOPaymentCarrier::SoftBank::Parameter.new(GMOPaymentCarrier::SoftBank::Const::API_KIND_EXEC) }

    it 'exec_tran_softbank_continuance parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:access_id].present?).to be true
      expect(target.errors[:access_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
      expect(target.errors[:ret_url].present?).to be true
      expect(target.errors[:charge_day].present?).to be true
      expect(target.errors[:first_month_free_flag].present?).to be true
    end

    it 'exec_tran_softbank_continuance parameter valid' do
      target.shop_id = 'dummmy shop_id'
      target.shop_pass = 'dummmy shop_pass'
      target.access_id = 'dummmy access_id'
      target.access_pass = 'dummmy access_pass'
      target.order_id = 'dummmy order_id'
      target.ret_url = 'dummmy ret_url'
      target.charge_day = GMOPaymentCarrier::SoftBank::Const::CHARGE_DAY_10
      target.first_month_free_flag = GMOPaymentCarrier::SoftBank::Const::FIRST_MONTH_FREE_FLAG_ON

      target.valid?

      expect(target.errors[:shop_id].blank?).to be true
      expect(target.errors[:shop_pass].blank?).to be true
      expect(target.errors[:access_id].blank?).to be true
      expect(target.errors[:access_pass].blank?).to be true
      expect(target.errors[:order_id].blank?).to be true
      expect(target.errors[:ret_url].blank?).to be true
      expect(target.errors[:charge_day].blank?).to be true
      expect(target.errors[:first_month_free_flag].blank?).to be true
    end
  end

  describe 'sb_continuance_cancel' do
    let(:target) { GMOPaymentCarrier::SoftBank::Parameter.new(GMOPaymentCarrier::SoftBank::Const::API_KIND_CANCEL) }

    it 'sb_continuance_cance parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:access_id].present?).to be true
      expect(target.errors[:access_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
    end

    it 'sb_continuance_cance parameter valid' do
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
