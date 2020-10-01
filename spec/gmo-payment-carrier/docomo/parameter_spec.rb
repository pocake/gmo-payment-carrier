describe GMOPaymentCarrier::Docomo::Parameter do
  describe 'entry_tran_docomo_continuance' do
    let(:target) do
      GMOPaymentCarrier::Docomo::Parameter.new(
        api_kind: GMOPaymentCarrier::Docomo::Const::API_KIND_ENTRY
      )
    end

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
    let(:target) do
      GMOPaymentCarrier::Docomo::Parameter.new(
        api_kind: GMOPaymentCarrier::Docomo::Const::API_KIND_EXEC
      )
    end

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

  describe 'docomo_continuance_shop_end' do
    let(:target) do
      GMOPaymentCarrier::Docomo::Parameter.new(
        api_kind: GMOPaymentCarrier::Docomo::Const::API_KIND_CANCEL
      )
    end

    it 'docomo_continuance_shop_end parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:access_id].present?).to be true
      expect(target.errors[:access_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
    end

    it 'docomo_continuance_shop_end parameter valid' do
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

  describe 'docomo_continuance_user_end' do
    let(:target) do
      GMOPaymentCarrier::Docomo::Parameter.new(
        api_kind: GMOPaymentCarrier::Docomo::Const::API_KIND_USER_CANCEL
      )
    end

    it 'docomo_continuance_user_end parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:access_id].present?).to be true
      expect(target.errors[:access_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
      expect(target.errors[:amount].present?).to be true
      expect(target.errors[:ret_url].present?).to be true
      expect(target.errors[:last_month_free_flag].present?).to be true
    end

    it 'docomo_continuance_user_end parameter valid' do
      target.shop_id = 'dummmy shop_id'
      target.shop_pass = 'dummmy shop_pass'
      target.access_id = 'dummmy access_id'
      target.access_pass = 'dummmy access_pass'
      target.order_id = 'dummmy order_id'
      target.amount = 'dummy amount'
      target.ret_url = 'dummy ret_url'
      target.last_month_free_flag = 'dummy last_month_free_flag'

      target.valid?

      expect(target.errors[:shop_id].blank?).to be true
      expect(target.errors[:shop_pass].blank?).to be true
      expect(target.errors[:access_id].blank?).to be true
      expect(target.errors[:access_pass].blank?).to be true
      expect(target.errors[:order_id].blank?).to be true
      expect(target.errors[:amount].blank?).to be true
      expect(target.errors[:ret_url].blank?).to be true
      expect(target.errors[:last_month_free_flag].blank?).to be true
    end
  end

  describe 'docomo_continuance_cancel_return' do
    let(:target) do
      GMOPaymentCarrier::Docomo::Parameter.new(
        api_kind: GMOPaymentCarrier::Docomo::Const::API_KIND_CHARGE_CANCEL
      )
    end

    it 'docomo_continuance_cancel_return parameter invalid' do
      target.valid?

      expect(target.errors[:shop_id].present?).to be true
      expect(target.errors[:shop_pass].present?).to be true
      expect(target.errors[:access_id].present?).to be true
      expect(target.errors[:access_pass].present?).to be true
      expect(target.errors[:order_id].present?).to be true
      expect(target.errors[:cancel_amount].present?).to be true
      expect(target.errors[:continuance_month].present?).to be true
    end

    it 'docomo_continuance_cancel_return parameter valid' do
      target.shop_id = 'dummmy shop_id'
      target.shop_pass = 'dummmy shop_pass'
      target.access_id = 'dummmy access_id'
      target.access_pass = 'dummmy access_pass'
      target.order_id = 'dummmy order_id'
      target.cancel_amount = 100
      target.continuance_month = 'dummmy continuance_month'

      target.valid?

      expect(target.errors.blank?).to be true
    end
  end
end
