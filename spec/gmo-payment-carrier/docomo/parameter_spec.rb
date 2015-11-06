describe GMOPaymentCarrier::AU::Parameter do
  describe 'entry_tran_docomo_continuance' do
    let(:target) { GMOPaymentCarrier::Docomo::Parameter.new(GMOPaymentCarrier::Docomo::Const::API_KIND_ENTRY) }

    it 'entry_tran_docomo_continuance parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
      expect(target.errors[:amount].present?).to be true
    end

    it 'entry_tran_docomo_continuance parameter valid' do
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

  describe 'exec_tran_docomo_continuance' do
    let(:target) { GMOPaymentCarrier::Docomo::Parameter.new(GMOPaymentCarrier::Docomo::Const::API_KIND_EXEC) }

    it 'exec_tran_softbank_continuance parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:access_id].present?).to be true
      expect(target.errors[:access_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
      expect(target.errors[:ret_url].present?).to be true
      expect(target.errors[:confirm_base_date].present?).to be true
      expect(target.errors[:first_month_free_flag].present?).to be true
    end

    it 'exec_tran_docomo_continuance parameter valid' do
      target.shop_id = 'dummmy shop_id'
      target.shop_pass = 'dummmy shop_pass'
      target.access_id = 'dummmy access_id'
      target.access_pass = 'dummmy access_pass'
      target.order_id = 'dummmy order_id'
      target.ret_url = 'dummmy ret_url'
      target.confirm_base_date = GMOPaymentCarrier::Docomo::Const::CONFIRM_BASE_DATE_10
      target.first_month_free_flag = GMOPaymentCarrier::Docomo::Const::FIRST_MONTH_FREE_FLAG_ON

      target.valid?

      expect(target.errors[:shop_id].blank?).to be true
      expect(target.errors[:shop_pass].blank?).to be true
      expect(target.errors[:access_id].blank?).to be true
      expect(target.errors[:access_pass].blank?).to be true
      expect(target.errors[:order_id].blank?).to be true
      expect(target.errors[:ret_url].blank?).to be true
      expect(target.errors[:confirm_base_date].blank?).to be true
      expect(target.errors[:first_month_free_flag].blank?).to be true
    end
  end

  describe 'docomo_continuance_user_end' do
    let(:target) { GMOPaymentCarrier::Docomo::Parameter.new(GMOPaymentCarrier::Docomo::Const::API_KIND_CANCEL) }

    it 'docomo_continuance_user_end parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:access_id].present?).to be true
      expect(target.errors[:access_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
    end

    it 'docomo_continuance_user_end parameter valid' do
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
