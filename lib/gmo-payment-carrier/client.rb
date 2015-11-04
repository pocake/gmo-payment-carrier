module GMOPaymentCarrier
  class Client
    def initialize(num_of_retry: 0, safe_invalid: false)
      @num_of_retry = num_of_retry
    end

    def call_api(paramer)
      # TODO: 独自Error作る
      raise "hogehoge" if paramer.invalid?

      api_info = api_info(paramer.api_kind)
      api_response =
        http_client.send(
          api_info[:method],
          path: api_info[:path],
          params: decode(paramer)
        )
      if api_response.more_than_400?
        raise "hogehoge"
      end

      result = encode(paramer, api_response.body)
      if result.exists_error?
        # TODO: 独自Error作る
        raise "hogehoge"
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

      def encode(paramer, query_string)
        GMOPaymentCarrier::Converter.encode(
          klass: paramer.class,
          query_string: query_string
        )
      end
  end
end
