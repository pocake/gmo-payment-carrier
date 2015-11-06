module GMOPaymentCarrier
  class Client
    def initialize(endpoint:, num_of_retry: 3)
      @endpoint     = endpoint
      @num_of_retry = num_of_retry
    end

    def call_api(paramer)
      raise ValidationError.new(paramer.invalid_message) if paramer.invalid?

      api_info = api_info(paramer.api_kind)
      api_response = nil
      Retriable.retriable(tries: @num_of_retry, base_interval: 1) do
        api_response =
          http_client.send(
            api_info[:method],
            path: api_info[:path],
            params: decode(paramer)
          )
      end
      raise HTTPError.new("#{api_response.status}:#{api_response.status_message}") if api_response.more_than_400?

      result = encode(paramer.api_kind, api_response.body)
      raise GMOSystemError.new(result.error_message) if result.exists_error?
      result
    end

    private

      def http_client
        @http_client ||= Http::Client.new(endpoint: @endpoint)
      end

      def api_info(kind)
        GMOPaymentCarrier::Const::API_INFOS[kind]
      end

      def decode(paramer)
        GMOPaymentCarrier::Converter.decode(paramer)
      end

      def encode(api_kind, query_string)
        GMOPaymentCarrier::Converter.encode(
          api_kind: api_kind,
          query_string: query_string
        )
      end
  end
end
