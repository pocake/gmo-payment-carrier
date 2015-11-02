module GMOPaymentCarrier
  class Client
    def initialize(num_of_retry: 0)
      @num_of_retry = num_of_retry
    end

    def call_api(paramer)
      # TODO: 独自Error作る
      raise "hogehoe" if paramer.invalid?

      api_info = api_info(paramer.api_kind)
      api_result =
        http_client.send(
          api_info[:method],
          path: api_info[:path],
          params: decode(paramer)
        )
      result = encode(paramer, api_result)

      if result.exists_error?
        # TODO: 独自Error作る
        raise "hogehoe"
      end

      result
    end

    private

      def http_client
        @http_client ||= Http::Client.new(endpoint: Const::API_ENDPOINT)
      end

      def api_info(kind)
        GMOPaymentCarrier::Const::API_INFOS[kind]
      end

      def decode(paramer)
        GMOPaymentCarrier::Converter.decode(paramer)
      end

      def encode(paramer, params)
        GMOPaymentCarrier::Converter.encode(
          klass: paramer.class,
          params: api_result
        )
      end
  end
end
