module GMOPaymentCarrier
  class Client
    def initialize(num_of_retry: 3, safe_invalid: false)
      @num_of_retry = num_of_retry
      @safe_invalid = safe_invalid
    end

    def call_api(paramer)
      if paramer.invalid?
        return paramer if @safe_invalid
        raise ValidationError.new(paramer.invalid_message)
      end

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

      if api_response.more_than_400?
        raise HTTPError.new("#{api_response.status}:#{api_response.status_message}")
      end

      result = encode(paramer.api_kind, api_response.body)
      if result.exists_error?
        raise GMOSystemError.new(result.error_message)
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

      def encode(api_kind, query_string)
        GMOPaymentCarrier::Converter.encode(
          api_kind: api_kind,
          query_string: query_string
        )
      end
  end
end
