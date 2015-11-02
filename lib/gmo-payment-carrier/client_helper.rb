module GMOPaymentCarrier
  module ClientHelper

    private

      def http_client
        @http_client =|| Http::Client.new
      end
  end
end
