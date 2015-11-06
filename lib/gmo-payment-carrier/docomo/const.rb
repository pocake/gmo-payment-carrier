module GMOPaymentCarrier
  module Docomo
    module Const
      # API種別
      API_KIND_ENTRY  = :entry_tran_docomo_continuance
      API_KIND_EXEC   = :exec_tran_docomo_continuance
      API_KIND_CANCEL = :docomo_continuance_user_end

      API_KINDS = [
        API_KIND_ENTRY,
        API_KIND_EXEC,
        API_KIND_CANCEL
      ]

      # 初月無料区分
      FIRST_MONTH_FREE_FLAG_OFF = 0 # 初月無料にしない
      FIRST_MONTH_FREE_FLAG_ON  = 1 # 初月無料にする
      # 確定基準日
      CONFIRM_BASE_DATE_10      = 10
      CONFIRM_BASE_DATE_15      = 15
      CONFIRM_BASE_DATE_20      = 20
      CONFIRM_BASE_DATE_25      = 25
      CONFIRM_BASE_DATE_31      = 31
    end
  end
end
