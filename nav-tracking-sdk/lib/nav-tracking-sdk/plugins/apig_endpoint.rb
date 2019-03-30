module NavTracking
  module Plugins

    class APIGEndpoint < Seahorse::Client::Plugin

      def after_initialize(client)
        if client.config.endpoint.nil?
          client.config.endpoint = 'https://pf6sevgyxa.execute-api.sa-east-1.amazonaws.com'
        end
      end

    end
  end
end
