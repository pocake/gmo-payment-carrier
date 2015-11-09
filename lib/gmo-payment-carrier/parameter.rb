module GMOPaymentCarrier
  class Parameter
    include ActiveModel::Model

    # API種別
    attr_accessor :api_kind

    def self.attribute_names
      [
        # バージョン
        :version,
        # ショップID
        :shop_id,
        # ショップパスワード
        :shop_pass,
        # オーダーID
        :order_id,
        # 課金利用金額
        :amount,
        # 課金税送料
        :tax,
        # 取引ID
        :access_id,
        # 取引パスワード
        :access_pass,
        # 加盟店自由項目1
        :client_field_1,
        # 加盟店自由項目2
        :client_Field_2,
        # 加盟店自由項目3
        :client_Field_3,
        # 決済結果戻しURL
        :ret_url,
        # 現状態
        :status,
        # 処理日時
        :tran_date,
        # エラーコード
        :err_code,
        # エラー詳細コード
        :err_info,
        # トークン
        :token,
        # 支払手続き開始IFのURL
        :start_url,
        # 支払開始期限日時
        :start_limit_date,
        # 支払開始期限秒
        :payment_term_sec
      ] | extension_attribute_names
    end

    def self.extension_attribute_names
      raise NotImplementedError.new("Must implement #{self.class}##{__method__}")
    end

    def initialize(env: :test, api_kind: nil)
      @env      = env.to_s
      @api_kind = api_kind
    end

    def env
      @env.to_s.try(:inquiry)
    end

    def endpoint
      return GMOPaymentCarrier::Const::TEST_API_ENDPOINT if env.test?
      return GMOPaymentCarrier::Const::PRODUCITON_API_ENDPOINT if env.production?

      nil
    end

    def exists_error?
      self.err_info.present?
    end

    def error_message
      return nil unless exists_error?

      {}.tap { |h|
        self.err_info.split('|').each do |v|
          msg = Const::ERROR_MESSAGES[v]
          h[v] = msg || 'there is no definition of the message.'
        end
      }.inspect
    end

    def invalid_message
      return nil if errors.blank?

      errors.to_h.inspect
    end
  end
end
