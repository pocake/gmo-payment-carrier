module GMOPaymentCarrier
  module AU
    class Csv < GMOPaymentCarrier::Csv
      ATTR_NAMES = [
        # ショップID
        :shop_id,
        # オーダID
        :order_id,
        # 課金確認日
        :billing_confirmed_date,
        # 課金日
        :billing_date,
        # 取引状態
        :status,
        # 利用金額
        :amount,
        # 税送料
        :tax,
        # au継続課金ID
        :aucontinu_accountid,
        # au決済情報番号
        :au_payment_information_number,
        # 取引ID
        :tran_id,
        # au加盟店管理番号
        :au_merchant_management_number,
        # エラーコード
        :err_code,
        # エラー詳細コード
        :err_info,
        # 処理日時
        :tran_date
      ]

      genarate_attrs ATTR_NAMES
    end
  end
end
