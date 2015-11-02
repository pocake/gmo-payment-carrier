require "spec_helper"

describe GMOPaymentCarrier::Client do
  describe "#call_api" do
    let(:client) { GMOPaymentCarrier::Client.new }

    describe "AU" do
      it do
        parameter = GMOPaymentCarrier::AU::Parameter.new
        parameter.api_kind = :entry_tran_au_continuance
        parameter.shop_id = 'hogehoge'
        parameter.shop_pass = 'hogehoge'
        parameter.order_id = 'hogehoge'
        parameter.amount = 100
        parameter.first_amount = 100

        client.call_api(parameter)
      end
    end
  end
end
