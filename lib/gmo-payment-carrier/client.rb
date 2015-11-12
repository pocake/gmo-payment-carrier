module GMOPaymentCarrier
  class Client
    def initialize(env: :test, num_of_retry: 3)
      @env          = env.to_s
      @num_of_retry = num_of_retry
    end

    def call_api(parameter)
      raise ValidationError.new(parameter.invalid_message) if parameter.invalid?

      api_info = api_info(parameter.api_kind)
      api_response = nil
      Retriable.retriable(tries: @num_of_retry, base_interval: 1) do
        api_response =
          http_client.send(
            api_info[:method],
            path: api_info[:path],
            params: decode(parameter)
          )
      end
      raise HTTPError.new("#{api_response.status}:#{api_response.status_message}") if api_response.more_than_400?

      result = encode(parameter, api_response.body)
      raise GMOSystemError.new(result.error_message) if result.exists_error?
      result
    end

    private

      def http_client
        @http_client ||= Http::Client.new(endpoint: endpoint)
      end

      def endpoint
        return Const::TEST_API_ENDPOINT if @env.try(:inquiry).test?
        return Const::PRODUCITON_API_ENDPOINT if @env.try(:inquiry).production?

        raise ArgumentError.new("env unexpected. env: #{@env}. (:test|:production)")
      end

      def api_info(kind)
        Const::API_INFOS[kind]
      end

      def decode(parameter)
        Converter.decode(parameter)
      end

      def encode(parameter, query_string)
        Converter.encode(
          mapping_klass: parameter.class,
          query_string: query_string
        )
      end
  end
end
