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
        # 取引ID
        :access_id,
        # 取引パスワード
        :access_pass,
        # サイトID
        :site_id,
        # サイトパスワード
        :site_pass,
        # 会員作成フラグ
        :create_member,
        # 加盟店自由項目1
        :client_field_1,
        # 加盟店自由項目2
        :client_Field_2,
        # 加盟店自由項目3
        :client_Field_3,
        # 現状態
        :status,
        # 処理日時
        :tran_date,
        # エラーコード
        :err_code,
        # エラー詳細コード
        :err_info
      ] | extension_attribute_names
    end

    def self.extension_attribute_names
      raise NotImplementedError.new("Must implement #{self.class}##{__method__}")
    end

    def initialize(api_kind:)
      @api_kind = api_kind
    end

    def exists_error?
      self.err_code.present?
    end
  end
end
