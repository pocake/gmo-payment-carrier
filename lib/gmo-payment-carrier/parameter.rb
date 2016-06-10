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
        :client_field_2,
        # 加盟店自由項目3
        :client_field_3,
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
        :payment_term_sec,
        # 支払い種別
        :pay_type,
        # ジョブコード
        :job_cd,
        # 支払開始期限
        :payment_term,
        # 課金開始月
        :start_charge_month,
        # 処理日付
        :process_date
      ] | extension_attribute_names
    end

    def self.extension_attribute_names
      raise NotImplementedError.new("Must implement #{self.class}##{__method__}")
    end

    # TODO: 一旦保留
    # def self.factory(api_kind, params = {})
    #   obj =
    #     if AU::API_KINDS.include?(api_kind)
    #       GMOPaymentCarrier::AU::Parameter.new(api_kind: api_kind)
    #     elsif Docomo::API_KINDS.include?(api_kind)
    #       GMOPaymentCarrier::Docomo::Parameter.new(api_kind: api_kind)
    #     else
    #       GMOPaymentCarrier::SoftBank::Parameter.new(api_kind: api_kind)
    #     end
    #   params.each { |k, v| obj.send("=#{k}", v) }
    #   obj
    # end

    def initialize(api_kind: nil)
      @api_kind = api_kind
      yield(self) if block_given?
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
