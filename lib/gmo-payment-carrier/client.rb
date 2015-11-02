module GMOPaymentCarrier
  class Client
    def initialize(num_of_retry: 0)
      @num_of_retry = num_of_retry
    end

    def call_api(paramer)
      if paramer.invalid?
        raise "hogehoe"
      end

      api_info = GMOPaymentCarrier::Const::API_INFOS[paramer.api_kind]
      result =
        http_client.send(
          api_info[:method],
          path: api_info[:path],
          params: GMOPaymentCarrier::Converter.decode(paramer)
        )
      output =
        GMOPaymentCarrier::Converter.encode(
          parameter_klass: paramer.class,
          params: result
        )

      if output.exists_error?
      end

      output
    end

    private

      def http_client
        @http_client ||= Http::Client.new(endpoint: 'http://example.com')
      end
  end
end
