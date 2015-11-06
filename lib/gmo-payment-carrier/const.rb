module GMOPaymentCarrier
  module Const
    # TODO
    PRODUCITON_API_ENDPOINT = 'https://p01.mul-pay.jp'
    TEST_API_ENDPOINT       = 'https://pt01.mul-pay.jp'

    module AU
      # API種別
      API_KIND_ENTRY  = :entry_tran_au_continuance
      API_KIND_EXEC   = :exec_tran_au_continuance
      API_KIND_CANCEL = :au_continuance_cancel
      API_KINDS = [
        API_KIND_ENTRY,
        API_KIND_EXEC,
        API_KIND_CANCEL
      ]

      # 課金タイミング区分
      ACCOUNT_TIMING_KBN_JUST_NOW         = '01' #課金タイミングで指定
      ACCOUNT_TIMING_KBN_END_OF_THE_MONTH = '02' #月末
    end

    module Docomo
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
      CONFIRM_BASE_DATE_10        = 10
      CONFIRM_BASE_DATE_15        = 15
      CONFIRM_BASE_DATE_20        = 20
      CONFIRM_BASE_DATE_25        = 25
      CONFIRM_BASE_DATE_31        = 31
    end

    API_INFOS =
      {}.tap do |h|
        h[AU::API_KIND_ENTRY] = {
          path: '/payment/EntryTranAuContinuance.idPass',
          method: :post
        }
        h[AU::API_KIND_EXEC] = {
          path: '/payment/ExecTranAuContinuance.idPass',
          method: :post
        }
        h[AU::API_KIND_CANCEL] = {
          path: '/payment/AuContinuanceCancel.idPass',
          method: :post
        }
        h[Docomo::API_KIND_ENTRY] = {
          path: '/payment/EntryTranDocomoContinuance.idPass',
          method: :post
        }
        h[Docomo::API_KIND_EXEC] = {
          path: '/payment/ExecTranDocomoContinuance.idPass',
          method: :post
        }
        h[Docomo::API_KIND_CANCEL] = {
          path: '/payment/DocomoContinuanceUserEnd.idPass',
          method: :post
        }
      end

    PARAM_NAMES = {
      version:                'Version',
      shop_id:                'ShopID',
      shop_pass:              'ShopPass',
      order_id:               'OrderID',
      amount:                 'Amount',
      tax:                    'Tax',
      first_amount:           'FirstAmount',
      first_tax:              'FirstTax',
      access_id:              'AccessID',
      access_pass:            'AccessPass',
      err_code:               'ErrCode',
      err_info:               'ErrInfo',
      site_id:                'SiteID',
      site_pass:              'SitePass',
      member_id:              'MemberID',
      member_name:            'MemberName',
      create_member:          'CreateMember',
      client_field_1:         'ClientField1',
      client_field_2:         'ClientField2',
      client_field_3:         'ClientField3',
      commodity:              'Commodity',
      account_timing_kbn:     'AccountTimingKbn',
      account_timing:         'AccountTiming',
      first_account_date:     'FirstAccountDate',
      ret_url:                'RetURL',
      payment_term_sec:       'PaymentTermSec',
      service_name:           'ServiceName',
      service_tel:            'ServiceTel',
      token:                  'Token',
      start_url:              'StartURL',
      start_limit_date:       'StartLimitDate',
      status:                 'Status',
      tran_date:              'TranDate',
      aucontinu_accountid:    'AuContinuAccountId',
      au_pay_method:          'AuPayMethod',
      docomo_disp_1:          'DocomoDisp1',
      docomo_disp_2:          'DocomoDisp2',
      first_month_free_flag:  'FirstMonthFreeFlag',
      confirm_base_date:      'ConfirmBaseDate',
      disp_shop_name:         'DispShopName',
      disp_phone_number:      'DispPhoneNumber',
      DispMailAddress:        'disp_mail_address',
      docomo_settlement_code: 'DocomoSettlementCode',
      charge_day:             'ChargeDay',
      sb_tracking_id:         'SbTrackingId',
      start_charge_month:     'StartChargeMonth'
    }.with_indifferent_access
    PARAM_NAMES_INVERTED = PARAM_NAMES.invert

    # TODO: 実装が大体終わった最後の方に頑張って追加する...
    ERROR_MESSAGES = {
      M01001005: 'バージョンの文字数が最大文字数を超えています',
      M01002001: 'ショップIDが指定されていません',
      M01002002: '指定されたIDとパスワードのショップが存在しません',
      M01002008: 'ショップIDの書式が正しくありません',
      M01003001: 'ショップパスワードが指定されていません',
      M01003008: 'ショップパスワードの書式が正しくありません',
      M01004001: 'オーダーIDが指定されていません',
      M01004002: '指定されたオーダーIDの取引は登録されていません',
      M01004010: '既にオーダーIDが存在しています',
      M01004012: 'オーダーIDが最大文字数を超えています',
      M01004013: 'オーダーIDに不正な文字が含まれています',
      M01004014: '指定されたオーダーIDの取引は既に決済を依頼してます',
      M01005001: '利用金額が指定されていません',
      M01005006: '利用金額が最大桁数を超えています',
      M01005011: '利用金額に数字以外の文字が含まれています',
      M01006005: '税送料が最大桁数を超えています',
      M01006006: '税送料に数字以外の文字が含まれています',
      M01007001: '取引IDが指定されていません',
      M01007008: '取引IDの書式が正しくありません',
      M01008001: '取引Iパスワードが指定されていません',
      M01008008: '取引パスワードの書式が正しくありません',
      M01039012: '加盟店自由項目1 が最大バイト数 を超えています',
      M01039013: '加盟店自由項目1 に不正な文字が 含まれています',
      M01040012: '加盟店自由項目2 が最大バイト数 を超えています',
      M01040013: '加盟店自由項目2 に不正な文字が 含まれています',
      M01041012: '加盟店自由項目3 が最大バイト数 を超えています',
      M01041013: '加盟店自由項目3 に不正な文字が 含まれています',
      M01042005: '結果返却方法フラグが最大文字数を超えています',
      M01042011: '結果返却方法フラグに”0 ”,”1 ”以 外の値が指定されています',
      M01043001: '商品・サービス名が指定されていません',
      M01043012: '商品・サービス名が最大バイト数を超えています',
      M01043013: '商品・サービス名に不正な文字が含まれています',
      M01044012: '決済開始メール付加情報が最大バイト数を超えています',
      M01044013: '決済開始メール付加情報に不正な文字が含まれています',
      M01045012: '決済完了メール付加情報が最大バイト数を超えています',
      M01045013: '決済完了メール付加情報に不正な文字が含まれています',
      M01046012: '決済内容確認画面付加情報が最大バイト数を超えています',
      M01046013: '決済内容確認画面付加情報に不正な文字が含まれています',
      M01047012: '決済完了画面付加情報が最大バイト数を超えています',
      M01047013: '決済完了画面付加情報に不正な文字が含まれています',
      M01048005: '支払期限秒数が最大文字数を超えています',
      M01048006: '支払期限秒数が有効な範囲ではありません',
      M01049012: '決済開始メール付加情報が最大バイト数を超えています',
      M01049013: '決済開始メール付加情報に不正な文字が含まれています'
    }.with_indifferent_access
  end
end
