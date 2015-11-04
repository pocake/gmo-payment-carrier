require "spec_helper"

describe GMOPaymentCarrier::AU::Parameter do
  describe 'entry_tran_au_continuance' do
    let(:target) { GMOPaymentCarrier::AU::Parameter.new(api_kind: :entry_tran_au_continuance) }

    it do
      target.shop_id = nil

      target.valid?
      expect(target.errors[:shop_id].present?).to eq(true)
    end
  end
end
