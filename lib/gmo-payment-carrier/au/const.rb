module GMOPaymentCarrier
  module AU
    module Const
      # API種別
      API_KIND_ENTRY  = :entry_tran_au_continuance
      API_KIND_EXEC   = :exec_tran_au_continuance
      API_KIND_CANCEL = :au_continuance_cancel
      API_KIND_SEARCH = :au_search

      API_KINDS = [
        API_KIND_ENTRY,
        API_KIND_EXEC,
        API_KIND_CANCEL,
        API_KIND_SEARCH
      ]

      # 課金タイミング区分
      ACCOUNT_TIMING_KBN_JUST_NOW         = '01' # 課金タイミングで指定
      ACCOUNT_TIMING_KBN_END_OF_THE_MONTH = '02' # 月末

      # 支払い区分
      PAY_TYPE = 13
    end
  end
end
