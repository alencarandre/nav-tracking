require 'seahorse/client/plugins/content_length.rb'
require 'aws-sdk-core/plugins/logging.rb'
require 'aws-sdk-core/plugins/param_converter.rb'
require 'aws-sdk-core/plugins/param_validator.rb'
require 'aws-sdk-core/plugins/helpful_socket_errors.rb'
require 'aws-sdk-core/plugins/retry_errors.rb'
require 'aws-sdk-core/plugins/global_configuration.rb'
require 'aws-sdk-core/plugins/response_paging.rb'
require 'aws-sdk-core/plugins/stub_responses.rb'
require 'aws-sdk-core/plugins/idempotency_token.rb'
require 'aws-sdk-core/plugins/jsonvalue_converter.rb'
require 'aws-sdk-core/plugins/client_metrics_plugin.rb'
require 'aws-sdk-core/plugins/client_metrics_send_plugin.rb'
require 'aws-sdk-core/plugins/protocols/api_gateway.rb'
require 'aws-sdk-core/plugins/api_key.rb'
require 'aws-sdk-core/plugins/apig_user_agent.rb'
require 'aws-sdk-core/plugins/apig_authorizer_token.rb'
require 'aws-sdk-core/plugins/apig_credentials_configuration.rb'
require 'nav-tracking-sdk/plugins/authorizer.rb'
require 'nav-tracking-sdk/plugins/apig_endpoint.rb'

Aws::Plugins::GlobalConfiguration.add_identifier(:navtracking)

module NavTracking
  class Client < Seahorse::Client::Base

    include Aws::ClientStubs

    @identifier = :navtracking

    set_api(ClientApi::API)

    add_plugin(Seahorse::Client::Plugins::ContentLength)
    add_plugin(Aws::Plugins::Logging)
    add_plugin(Aws::Plugins::ParamConverter)
    add_plugin(Aws::Plugins::ParamValidator)
    add_plugin(Aws::Plugins::HelpfulSocketErrors)
    add_plugin(Aws::Plugins::RetryErrors)
    add_plugin(Aws::Plugins::GlobalConfiguration)
    add_plugin(Aws::Plugins::ResponsePaging)
    add_plugin(Aws::Plugins::StubResponses)
    add_plugin(Aws::Plugins::IdempotencyToken)
    add_plugin(Aws::Plugins::JsonvalueConverter)
    add_plugin(Aws::Plugins::ClientMetricsPlugin)
    add_plugin(Aws::Plugins::ClientMetricsSendPlugin)
    add_plugin(Aws::Plugins::Protocols::ApiGateway)
    add_plugin(Aws::Plugins::ApiKey)
    add_plugin(Aws::Plugins::APIGUserAgent)
    add_plugin(Aws::Plugins::APIGAuthorizerToken)
    add_plugin(Aws::Plugins::APIGCredentialsConfiguration)
    add_plugin(NavTracking::Plugins::Authorizer)
    add_plugin(NavTracking::Plugins::APIGEndpoint)

    # @overload initialize(options)
    #   @param [Hash] options
    #   @option options [String] :access_key_id
    #
    #   @option options [String] :api_key
    #     When provided, `x-api-key` header will be injected with the value provided.
    #
    #   @option options [Boolean] :client_side_monitoring (false)
    #     When `true`, client-side metrics will be collected for all API requests from
    #     this client.
    #
    #   @option options [String] :client_side_monitoring_client_id ("")
    #     Allows you to provide an identifier for this client which will be attached to
    #     all generated client side metrics. Defaults to an empty string.
    #
    #   @option options [Integer] :client_side_monitoring_port (31000)
    #     Required for publishing client metrics. The port that the client side monitoring
    #     agent is running on, where client metrics will be published via UDP.
    #
    #   @option options [Aws::ClientSideMonitoring::Publisher] :client_side_monitoring_publisher (Aws::ClientSideMonitoring::Publisher)
    #     Allows you to provide a custom client-side monitoring publisher class. By default,
    #     will use the Client Side Monitoring Agent Publisher.
    #
    #   @option options [Boolean] :convert_params (true)
    #     When `true`, an attempt is made to coerce request parameters into
    #     the required types.
    #
    #   @option options [Aws::CredentialProvider] :credentials
    #     AWS Credentials options is only required when your API uses
    #     [AWS Signature Version 4](http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html),
    #     more AWS Credentials Configuration Options are available [here](https://github.com/aws/aws-sdk-ruby#configuration).
    #
    #   @option options [Aws::Log::Formatter] :log_formatter (Aws::Log::Formatter.default)
    #     The log formatter.
    #
    #   @option options [Symbol] :log_level (:info)
    #     The log level to send messages to the `:logger` at.
    #
    #   @option options [Logger] :logger
    #     The Logger instance to send log messages to.  If this option
    #     is not set, logging will be disabled.
    #
    #   @option options [String] :profile
    #
    #   @option options [Float] :retry_base_delay (0.3)
    #     The base delay in seconds used by the default backoff function.
    #
    #   @option options [Symbol] :retry_jitter (:none)
    #     A delay randomiser function used by the default backoff function. Some predefined functions can be referenced by name - :none, :equal, :full, otherwise a Proc that takes and returns a number.
    #
    #     @see https://www.awsarchitectureblog.com/2015/03/backoff.html
    #
    #   @option options [Integer] :retry_limit (3)
    #     The maximum number of times to retry failed requests.  Only
    #     ~ 500 level server errors and certain ~ 400 level client errors
    #     are retried.  Generally, these are throttling errors, data
    #     checksum errors, networking errors, timeout errors and auth
    #     errors from expired credentials.
    #
    #   @option options [Integer] :retry_max_delay (0)
    #     The maximum number of seconds to delay between retries (0 for no limit) used by the default backoff function.
    #
    #   @option options [String] :secret_access_key
    #
    #   @option options [String] :session_token
    #
    #   @option options [Boolean] :stub_responses (false)
    #     Causes the client to return stubbed responses. By default
    #     fake responses are generated and returned. You can specify
    #     the response data to return or errors to raise by calling
    #     {ClientStubs#stub_responses}. See {ClientStubs} for more information.
    #
    #     ** Please note ** When response stubbing is enabled, no HTTP
    #     requests are made, and retries are disabled.
    #
    #   @option options [Boolean] :validate_params (true)
    #     When `true`, request parameters are validated before
    #     sending the request.
    #
    def initialize(*args)
      super
    end

    # @!group API Operations

    # @return [Types::GetTrackingResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::GetTrackingResponse#empty #empty} => Types::Empty
    #
    # @example Response structure
    #
    #
    #
    # @overload get_tracking(params = {})
    # @param [Hash] params ({})
    def get_tracking(params = {}, options = {})
      req = build_request(:get_tracking, params)
      req.send_request(options)
    end

    # @return [Types::PostTrackingResponse] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
    #
    #   * {Types::PostTrackingResponse#empty #empty} => Types::Empty
    #
    # @example Response structure
    #
    #
    #
    # @overload post_tracking(params = {})
    # @param [Hash] params ({})
    def post_tracking(params = {}, options = {})
      req = build_request(:post_tracking, params)
      req.send_request(options)
    end

    # @!endgroup

    # @param params ({})
    # @api private
    def build_request(operation_name, params = {})
      handlers = @handlers.for(operation_name)
      authorizer = nil
      if config.api.operation(operation_name).authorizer
        authorizer_name = config.api.operation(operation_name).authorizer
        config.api.authorizers.each do |_, auth|
          authorizer = auth if auth.name == authorizer_name
        end
      end
      context = Seahorse::Client::RequestContext.new(
        operation_name: operation_name,
        operation: config.api.operation(operation_name),
        authorizer: authorizer,
        client: self,
        params: params,
        config: config)
      context[:gem_name] = 'nav-tracking-sdk'
      context[:gem_version] = '0.1.0'
      Seahorse::Client::Request.new(handlers, context)
    end

    # @api private
    # @deprecated
    def waiter_names
      []
    end

    class << self

      # @api private
      attr_reader :identifier

      # @api private
      def errors_module
        Errors
      end

    end
  end
end
