module GMOPaymentCarrier
  module Const
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
      err_code:               'ErrCode',
      err_info:               'ErrInfo',
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
    }

    API_INFOS = {
      entry_tran_au_continuance: {
        path: '/payment/EntryTranAuContinuance.idPass',
        method: :post
      },
      exec_tran_au_continuance: {
        path: '/payment/ExecTranAuContinuance.idPass',
        method: :post
      },
      au_continuance_cancel: {
        path: '/payment/AuContinuanceCancel.idPass',
        method: :post
      }
    }
  end
end
