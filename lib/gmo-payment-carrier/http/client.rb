module GMOPaymentCarrier
  module Http
    class Client
      DEFAULT_HEADERS = {
        "Accept" => "application/json",
        "User-Agent" => "Piese of Cake"
      }.freeze

      def initialize(endpoint:, request: :url_encoded, response: :logger)
        @endpoint = endpoint
        @request  = request
        @response = response
      end

      def connection
        @connection ||= Faraday.new(faraday_client_options) do |connection|
          connection.request @request if @request.present?
          connection.response @response if @Response.present?
          connection.adapter Faraday.default_adapter
        end
      end

      def get(path:, params: nil, headers: nil)
        process(:get, path, params, headers)
      end

      def post(path:, params: nil, headers: nil)
        process(:post, path, params, headers)
      end

      def patch(path:, params: nil, headers: nil)
        process(:patch, path, params, headers)
      end

      def put(path:, params: nil, headers: nil)
        process(:put, path, params, headers)
      end

      def delete(path:, params: nil, headers: nil)
        process(:delete, path, params, headers)
      end

      private

        def process(request_method, path, params, headers)
          Response.new(
            connection.send(
              request_method,
              URI.escape(path),
              params,
              headers,
            )
          )
        end

        def default_headers
          DEFAULT_HEADERS.clone
        end

        def faraday_client_options
          {
            headers: default_headers,
            url: @endpoint,
          }
        end
    end
  end
end
