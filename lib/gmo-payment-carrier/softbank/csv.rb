module GMOPaymentCarrier
  module SoftBank
    class Csv < GMOPaymentCarrier::Csv
      ATTR_NAMES = [
        # ショップID
        :shop_id,
        # オーダID
        :order_id,
        # 課金日
        :billing_date,
        # 取引状態
        :status,
        # 利用金額
        :amount,
        # 税送料
        :tax,
        # ソフトバンク処理トラッキングID
        :sb_tracking_id,
        # エラーコード
        :err_code,
        # エラー詳細コード
        :err_info,
        # 処理日時
        :tran_date
      ]

      genarate_attrs ATTR_NAMES
    end
  end
end
