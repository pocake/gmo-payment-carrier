module GMOPaymentCarrier
  module SoftBank
    module Const
      # API種別
      API_KIND_ENTRY         = :entry_tran_sb_continuance
      API_KIND_EXEC          = :exec_tran_sb_continuance
      API_KIND_CANCEL        = :sb_continuance_cancel
      API_KIND_SEARCH        = :sb_search
      API_KIND_CHARGE_CANCEL = :sb_continuance_charge_cancel

      API_KINDS = [
        API_KIND_ENTRY,
        API_KIND_EXEC,
        API_KIND_CANCEL,
        API_KIND_SEARCH,
        API_KIND_CHARGE_CANCEL
      ]

      # 初月無料区分
      FIRST_MONTH_FREE_FLAG_OFF = 0 # 課金する
      FIRST_MONTH_FREE_FLAG_ON  = 1 # 課金しない(申し込みのみ)
      # 課金基準日
      CHARGE_DAY_10             = 10
      CHARGE_DAY_15             = 15
      CHARGE_DAY_20             = 20
      CHARGE_DAY_25             = 25
      CHARGE_DAY_31             = 31

      PAY_TYPE = 22
    end
  end
end
