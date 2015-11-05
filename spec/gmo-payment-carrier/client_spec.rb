describe GMOPaymentCarrier::Client do
  describe "#call_api" do
    let(:http_client) { double('http_client') }
    let(:client) { GMOPaymentCarrier::Client.new(endpoint: GMOPaymentCarrier::Const::TEST_API_ENDPOINT) }
    let(:access_id) { '123456789' }
    let(:access_pass) { FFaker::Internet.password }
    let(:token) { SecureRandom.hex }
    let(:start_url) { FFaker::Internet.http_url }
    let(:start_limit_date) { Time.now.strftime('%Y%m%d%H%M%S') }
    let(:shop_id) { 'tshop123456789' }
    let(:shop_pass) { FFaker::Internet.password }
    let(:order_id) { 'order123456789' }
    let(:commodity) { 'commodity' }
    let(:account_timing_kbn) { GMOPaymentCarrier::Const::AU::ACCOUNT_TIMING_KBN_JUST_NOW }
    let(:account_timing) { '1' }
    let(:ret_url) { FFaker::Internet.http_url }
    let(:service_name) { FFaker::Internet.domain_name }
    let(:service_tel) { FFaker::PhoneNumber.phone_number }
    let(:status) { 'CANCEL' }

    context "AU" do
      context "entry_tran_au_continuance" do
        let(:parameter) { GMOPaymentCarrier::AU::Parameter.new(GMOPaymentCarrier::Const::AU::API_KIND_ENTRY) }

        it 'return success' do
          response = double('response')
          body = "AccessID=#{access_id}&AccessPass=#{access_pass}&ErrCode=&ErrInfo="
          allow(response).to receive(:more_than_400?).and_return(false)
          allow(response).to receive(:body).and_return(body)
          allow(http_client).to receive(:post).and_return(response)
          allow(client).to receive(:http_client).and_return(http_client)

          parameter.shop_id = shop_id
          parameter.shop_pass = shop_pass
          parameter.order_id = order_id
          parameter.amount = 100
          parameter.first_amount = 100

          result = client.call_api(parameter)
          expect(result.access_id).to eq(access_id)
          expect(result.access_pass).to eq(access_pass)
          expect(result.err_code.blank?).to be true
          expect(result.err_info.blank?).to be true
        end

        it 'return ValidationError' do
          expect { client.call_api(parameter) }.to raise_error(GMOPaymentCarrier::ValidationError)
        end

        it 'return HTTPError' do
          response = double('response')
          allow(response).to receive(:more_than_400?).and_return(true)
          allow(response).to receive(:status).and_return(404)
          allow(response).to receive(:status_message).and_return('Not Found')
          allow(http_client).to receive(:post).and_return(response)
          allow(client).to receive(:http_client).and_return(http_client)

          parameter.shop_id = shop_id
          parameter.shop_pass = shop_pass
          parameter.order_id = order_id
          parameter.amount = 100
          parameter.first_amount = 100

          expect { client.call_api(parameter) }.to raise_error(GMOPaymentCarrier::HTTPError)
        end
      end

      context "exec_tran_au_continuanc" do
        let(:parameter) { GMOPaymentCarrier::AU::Parameter.new(GMOPaymentCarrier::Const::AU::API_KIND_EXEC) }

        it 'return success' do
          response = double('response')
          body = "AccessID=#{access_id}&Token=#{token}&StartURL=#{start_url}&StartLimitDate=#{start_limit_date}&ErrCode=&ErrInfo="
          allow(response).to receive(:more_than_400?).and_return(false)
          allow(response).to receive(:body).and_return(body)
          allow(http_client).to receive(:post).and_return(response)
          allow(client).to receive(:http_client).and_return(http_client)

          parameter.shop_id = shop_id
          parameter.shop_pass = shop_pass
          parameter.access_id = access_id
          parameter.access_pass = access_pass
          parameter.order_id = order_id
          parameter.commodity = commodity
          parameter.account_timing_kbn = account_timing_kbn
          parameter.account_timing = account_timing
          parameter.first_account_date = Time.now.next_month.beginning_of_day
          parameter.ret_url = ret_url
          parameter.service_name = service_name
          parameter.service_tel = service_tel

          result = client.call_api(parameter)
          expect(result.access_id).to eq(access_id)
          expect(result.token).to eq(token)
          expect(result.start_url).to eq(start_url)
          expect(result.start_limit_date).to eq(start_limit_date)
          expect(result.err_code.blank?).to be true
          expect(result.err_info.blank?).to be true
        end

        it 'return ValidationError' do
          expect { client.call_api(parameter) }.to raise_error(GMOPaymentCarrier::ValidationError)
        end

        it 'return HTTPError' do
          response = double('response')
          allow(response).to receive(:more_than_400?).and_return(true)
          allow(response).to receive(:status).and_return(404)
          allow(response).to receive(:status_message).and_return('Not Found')
          allow(http_client).to receive(:post).and_return(response)
          allow(client).to receive(:http_client).and_return(http_client)

          parameter.shop_id = shop_id
          parameter.shop_pass = shop_pass
          parameter.access_id = access_id
          parameter.access_pass = access_pass
          parameter.order_id = order_id
          parameter.commodity = commodity
          parameter.account_timing_kbn = account_timing_kbn
          parameter.account_timing = account_timing
          parameter.first_account_date = Time.now.next_month.beginning_of_day
          parameter.ret_url = ret_url
          parameter.service_name = service_name
          parameter.service_tel = service_tel

          expect { client.call_api(parameter) }.to raise_error(GMOPaymentCarrier::HTTPError)
        end
      end

      context "au_continuance_cancel" do
        let(:parameter) { GMOPaymentCarrier::AU::Parameter.new(GMOPaymentCarrier::Const::AU::API_KIND_CANCEL) }

        it 'return success' do
          response = double('response')
          body = "OrderID=#{order_id}&Status=#{status}&ErrCode=&ErrInfo="
          allow(response).to receive(:more_than_400?).and_return(false)
          allow(response).to receive(:body).and_return(body)
          allow(http_client).to receive(:post).and_return(response)
          allow(client).to receive(:http_client).and_return(http_client)

          parameter.shop_id = shop_id
          parameter.shop_pass = shop_pass
          parameter.access_id = access_id
          parameter.access_pass = access_pass
          parameter.order_id = order_id

          result = client.call_api(parameter)
          expect(result.order_id).to eq(order_id)
          expect(result.status).to eq(status)
          expect(result.err_code.blank?).to be true
          expect(result.err_info.blank?).to be true
        end

        it 'return ValidationError' do
          expect { client.call_api(parameter) }.to raise_error(GMOPaymentCarrier::ValidationError)
        end

        it 'return HTTPError' do
          response = double('response')
          allow(response).to receive(:more_than_400?).and_return(true)
          allow(response).to receive(:status).and_return(404)
          allow(response).to receive(:status_message).and_return('Not Found')
          allow(http_client).to receive(:post).and_return(response)
          allow(client).to receive(:http_client).and_return(http_client)

          parameter.shop_id = shop_id
          parameter.shop_pass = shop_pass
          parameter.access_id = access_id
          parameter.access_pass = access_pass
          parameter.order_id = order_id

          expect { client.call_api(parameter) }.to raise_error(GMOPaymentCarrier::HTTPError)
        end
      end
    end

    context "Docomo" do
      context "entry_tran_au_continuance" do
        let(:parameter) { GMOPaymentCarrier::Docomo::Parameter.new(GMOPaymentCarrier::Const::Docomo::API_KIND_ENTRY) }

        it 'return success' do
          response = double('response')
          body = "AccessID=#{access_id}&AccessPass=#{access_pass}&ErrCode=&ErrInfo="
          allow(response).to receive(:more_than_400?).and_return(false)
          allow(response).to receive(:body).and_return(body)
          allow(http_client).to receive(:post).and_return(response)
          allow(client).to receive(:http_client).and_return(http_client)

          parameter.shop_id = shop_id
          parameter.shop_pass = shop_pass
          parameter.order_id = order_id
          parameter.amount = 100

          result = client.call_api(parameter)
          expect(result.access_id).to eq(access_id)
          expect(result.access_pass).to eq(access_pass)
          expect(result.err_code.blank?).to be true
          expect(result.err_info.blank?).to be true
        end

        it 'return ValidationError' do
          expect { client.call_api(parameter) }.to raise_error(GMOPaymentCarrier::ValidationError)
        end
      end

      context "exec_tran_docomo_continuance" do
        let(:parameter) { GMOPaymentCarrier::Docomo::Parameter.new(GMOPaymentCarrier::Const::Docomo::API_KIND_EXEC) }

        it 'return success' do
          response = double('response')
          body = "AccessID=#{access_id}&Token=#{token}&StartURL=#{start_url}&StartLimitDate=#{start_limit_date}&ErrCode=&ErrInfo="
          allow(response).to receive(:more_than_400?).and_return(false)
          allow(response).to receive(:body).and_return(body)
          allow(http_client).to receive(:post).and_return(response)
          allow(client).to receive(:http_client).and_return(http_client)

          parameter.shop_id = shop_id
          parameter.shop_pass = shop_pass
          parameter.access_id = access_id
          parameter.access_pass = access_pass
          parameter.order_id = order_id
          parameter.ret_url = ret_url
          parameter.first_month_free_flag = GMOPaymentCarrier::Const::Docomo::FIRST_MONTH_FREE_FLAG_ON
          parameter.confirm_base_date = GMOPaymentCarrier::Const::Docomo::CONFIRM_BASE_DATE_10

          result = client.call_api(parameter)
          expect(result.access_id).to eq(access_id)
          expect(result.token).to eq(token)
          expect(result.start_url).to eq(start_url)
          expect(result.start_limit_date).to eq(start_limit_date)
          expect(result.err_code.blank?).to be true
          expect(result.err_info.blank?).to be true
        end

        it 'return ValidationError' do
          expect { client.call_api(parameter) }.to raise_error(GMOPaymentCarrier::ValidationError)
        end
      end

      context "docomo_continuance_user_end" do
        let(:parameter) { GMOPaymentCarrier::Docomo::Parameter.new(GMOPaymentCarrier::Const::Docomo::API_KIND_CANCEL) }

        it 'return success' do
          response = double('response')
          body = "OrderID=#{order_id}&Status=#{status}&ErrCode=&ErrInfo="
          allow(response).to receive(:more_than_400?).and_return(false)
          allow(response).to receive(:body).and_return(body)
          allow(http_client).to receive(:post).and_return(response)
          allow(client).to receive(:http_client).and_return(http_client)

          parameter.shop_id = shop_id
          parameter.shop_pass = shop_pass
          parameter.access_id = access_id
          parameter.access_pass = access_pass
          parameter.order_id = order_id

          result = client.call_api(parameter)
          expect(result.order_id).to eq(order_id)
          expect(result.status).to eq(status)
          expect(result.err_code.blank?).to be true
          expect(result.err_info.blank?).to be true
        end

        it 'return ValidationError' do
          expect { client.call_api(parameter) }.to raise_error(GMOPaymentCarrier::ValidationError)
        end
      end
    end
  end
end
