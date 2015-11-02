require "spec_helper"

describe GMOPaymentCarrier::AU::Parameter do
  let(:target) { GMOPaymentCarrier::AU::Parameter.new }

  it do
    target.api_kind = :entry_tran_au_continuance
    target.shop_id = nil

    target.valid?
    expect(target.errors[:shop_id].present?).to eq(true)
  end
end
