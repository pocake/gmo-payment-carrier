module GMOPaymentCarrier
  module RSpecHelper
    # GMOSystemErrorを発生させる
    def set_gmo_raise_error_stub
      error_message = GMOPaymentCarrier::Const::ERROR_MESSAGES.values.sample
      error = GMOPaymentCarrier::GMOSystemError.new(error_message)
      allow_any_instance_of(GMOPaymentCarrier::Client).to receive(:call_api).and_return(error)
    end

    # auかんたん決済継続課金#取引登録#正常
    def set_au_entry_normality_stub
      result = GMOPaymentCarrier::AU::Parameter.new
      result.access_id = '123456789'
      result.access_pass = FFaker::Internet.password

      set_call_api_stub(result)
    end

    # auかんたん決済継続課金#決済実行#正常
    def set_au_exec_normality_stub
      result = GMOPaymentCarrier::AU::Parameter.new
      result.access_id = '123456789'
      result.token = SecureRandom.hex(64)
      result.start_url = FFaker::Internet.http_url
      result.start_limit_date = Time.now.strftime('%Y%m%d%H%M%S')

      set_call_api_stub(result)
    end

    # auかんたん決済継続課金#継続課金解約#正常
    def set_au_cancel_normality_stub
      result = GMOPaymentCarrier::AU::Parameter.new
      result.order_id = "#{SecureRandom.hex(8)}-#{Time.now.to_i}"
      result.status = 'CANCEL'

      set_call_api_stub(result)
    end


    # ドコモ継続課金サービス決済#継続課金解約#正常
    def set_docomo_entry_normality_stub
      result = GMOPaymentCarrier::Docomo::Parameter.new
      result.access_id = '123456789'
      result.access_pass = FFaker::Internet.password

      set_call_api_stub(result)
    end

    # ドコモ継続課金サービス決済#決済実行#正常
    def set_docomo_exec_normality_stub
      result = GMOPaymentCarrier::Docomo::Parameter.new
      result.access_id = '123456789'
      result.token = SecureRandom.hex(64)
      result.start_url = FFaker::Internet.http_url
      result.start_limit_date = Time.now.strftime('%Y%m%d%H%M%S')

      set_call_api_stub(result)
    end


    # ドコモ継続課金サービス決済#継続課金終了(利用者)#正常
    def set_docomo_cancel_normality_stub
      result = GMOPaymentCarrier::AU::Parameter.new
      result.shop_id = "tshop_123456789"
      result.order_id = "#{SecureRandom.hex(8)}-#{Time.now.to_i}"
      result.status = 'END'
      result.tran_date = Time.now.strftime('%Y%m%d%H%M%S')

      set_call_api_stub(result)
    end

    # ソフトバンクまとめて支払い(B)継続課金決済#取引登録#正常
    def set_sb_entry_normality_stub
      result = GMOPaymentCarrier::SoftBank::Parameter.new
      result.access_id = '123456789'
      result.access_pass = FFaker::Internet.password

      set_call_api_stub(result)
    end

    # ソフトバンクまとめて支払い(B)継続課金決済#決済実行#正常
    def set_au_calcel_normality_stub
      result = GMOPaymentCarrier::SoftBank::Parameter.new
      result.order_id = "#{SecureRandom.hex(8)}-#{Time.now.to_i}"
      result.status = 'CANCEL'

      set_call_api_stub(result)
    end

    private

      def set_call_api_stub(result)
        allow_any_instance_of(GMOPaymentCarrier::Client).to receive(:call_api).and_return(result)
      end
  end
end
