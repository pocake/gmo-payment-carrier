module GMOPaymentCarrier
  module Docomo
    # ドコモ申込状況ファイルのParse用
    class CsvOrder < GMOPaymentCarrier::Csv
      ATTR_NAMES = [
        # ショップID
        :shop_id,
        # オーダID
        :order_id,
        # 取引状態
        :status,
        # 利用金額
        :amount,
        # 税送料,
        :tax,
        # 変更利用金額
        :change_amount,
        # 変更税送料
        :change_tax,
        # ドコモ表示項目1
        :docomo_disp_1,
        # ドコモ表示項目2
        :docomo_disp_2,
        # ドコモ決済番号
        :docomo_settlement_code,
        # 加盟店自由項目1
        :client_field_1,
        # 加盟店自由項目2
        :client_field_2,
        # 加盟店自由項目3
        :client_field_3,
        # 取引ID
        :tran_id,
        # 取引パスワード
        :tran_pass,
        # ドコモ加盟店注文番号
        :docomo_merchant_order_number,
        # ドコモ端末区分
        :docomo_terminal_segment,
        # Wi-fiテザリング接続
        :wifi_tethering_connection,
        # 確定基準日
        :confirm_base_date,
        # 初月無料フラグ
        :first_month_free_flag,
        # 終了月無料フラグ
        :end_month_free_flag,
        # 継続課金終了日
        :continue_billing_end_date,
        # エラーコード
        :err_code,
        # エラー詳細コード
        :err_info,
        # 処理日時
        :tran_date
      ]

      genarate_attrs ATTR_NAMES
    end

    # ドコモ日次課金ファイルのParse用
    class CsvBilling < GMOPaymentCarrier::Csv
      ATTR_NAMES = [
        # ショップID
        :shop_id,
        # オーダID
        :order_id,
        # 課金月
        :charge_month,
        # 取引状態
        :status,
        # 利用金額
        :amount,
        # 税送料,
        :tax,
        # キャンセル金額
        :canceled_amount,
        # キャンセル税送料
        :canceled_tax,
        # 取引ID
        :tran_id,
        # 取引パスワード
        :tran_pass,
        # ドコモ決済番号
        :docomo_tran_number,
        # ドコモ加盟店注文番号
        :docomo_merchant_order_number,
        # 処理期限
        :tran_limit_date,
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
