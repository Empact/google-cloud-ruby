# frozen_string_literal: true

# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "google/cloud/errors"
require "google/cloud/compute/v1/compute_pb"

module Google
  module Cloud
    module Compute
      module V1
        module TargetGrpcProxies
          module Rest
            ##
            # REST client for the TargetGrpcProxies service.
            #
            # The TargetGrpcProxies API.
            #
            class Client
              include GrpcTranscoding

              # @private
              attr_reader :target_grpc_proxies_stub

              ##
              # Configure the TargetGrpcProxies Client class.
              #
              # See {::Google::Cloud::Compute::V1::TargetGrpcProxies::Rest::Client::Configuration}
              # for a description of the configuration fields.
              #
              # ## Example
              #
              # To modify the configuration for all TargetGrpcProxies clients:
              #
              #     ::Google::Cloud::Compute::V1::TargetGrpcProxies::Rest::Client.configure do |config|
              #       config.timeout = 10.0
              #     end
              #
              # @yield [config] Configure the Client client.
              # @yieldparam config [Client::Configuration]
              #
              # @return [Client::Configuration]
              #
              def self.configure
                @configure ||= begin
                  namespace = ["Google", "Cloud", "Compute", "V1"]
                  parent_config = while namespace.any?
                                    parent_name = namespace.join "::"
                                    parent_const = const_get parent_name
                                    break parent_const.configure if parent_const.respond_to? :configure
                                    namespace.pop
                                  end
                  default_config = Client::Configuration.new parent_config

                  default_config
                end
                yield @configure if block_given?
                @configure
              end

              ##
              # Configure the TargetGrpcProxies Client instance.
              #
              # The configuration is set to the derived mode, meaning that values can be changed,
              # but structural changes (adding new fields, etc.) are not allowed. Structural changes
              # should be made on {Client.configure}.
              #
              # See {::Google::Cloud::Compute::V1::TargetGrpcProxies::Rest::Client::Configuration}
              # for a description of the configuration fields.
              #
              # @yield [config] Configure the Client client.
              # @yieldparam config [Client::Configuration]
              #
              # @return [Client::Configuration]
              #
              def configure
                yield @config if block_given?
                @config
              end

              ##
              # Create a new TargetGrpcProxies REST client object.
              #
              # ## Examples
              #
              # To create a new TargetGrpcProxies REST client with the default
              # configuration:
              #
              #     client = ::Google::Cloud::Compute::V1::TargetGrpcProxies::Rest::Client.new
              #
              # To create a new TargetGrpcProxies REST client with a custom
              # configuration:
              #
              #     client = ::Google::Cloud::Compute::V1::TargetGrpcProxies::Rest::Client.new do |config|
              #       config.timeout = 10.0
              #     end
              #
              # @yield [config] Configure the TargetGrpcProxies client.
              # @yieldparam config [Client::Configuration]
              #
              def initialize
                # These require statements are intentionally placed here to initialize
                # the REST modules only when it's required.
                require "gapic/rest"

                # Create the configuration object
                @config = Configuration.new Client.configure

                # Yield the configuration if needed
                yield @config if block_given?

                # Create credentials
                credentials = @config.credentials
                credentials ||= Credentials.default scope: @config.scope
                if credentials.is_a?(String) || credentials.is_a?(Hash)
                  credentials = Credentials.new credentials, scope: @config.scope
                end

                @client_stub = ::Gapic::Rest::ClientStub.new endpoint: @config.endpoint, credentials: credentials
              end

              # Service calls

              ##
              # Deletes the specified TargetGrpcProxy in the given scope
              #
              # @overload delete(request, options = nil)
              #   Pass arguments to `delete` via a request object, either of type
              #   {::Google::Cloud::Compute::V1::DeleteTargetGrpcProxyRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Compute::V1::DeleteTargetGrpcProxyRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #     Note: currently retry functionality is not implemented. While it is possible
              #     to set it using ::Gapic::CallOptions, it will not be applied
              #
              # @overload delete(project: nil, request_id: nil, target_grpc_proxy: nil)
              #   Pass arguments to `delete` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param project [::String]
              #     Project ID for this request.
              #   @param request_id [::String]
              #     An optional request ID to identify requests. Specify a unique request ID so that if you must retry your request, the server will know to ignore the request if it has already been completed.
              #
              #     For example, consider a situation where you make an initial request and the request times out. If you make the request again with the same request ID, the server can check if original operation with the same request ID was received, and if so, will ignore the second request. This prevents clients from accidentally creating duplicate commitments.
              #
              #     The request ID must be a valid UUID with the exception that zero UUID is not supported (00000000-0000-0000-0000-000000000000).
              #   @param target_grpc_proxy [::String]
              #     Name of the TargetGrpcProxy resource to delete.
              # @yield [result, env] Access the result along with the Faraday environment object
              # @yieldparam result [::Google::Cloud::Compute::V1::Operation]
              # @yieldparam response [::Faraday::Response]
              #
              # @return [::Google::Cloud::Compute::V1::Operation]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              def delete request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Compute::V1::DeleteTargetGrpcProxyRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = {}

                # Set x-goog-api-client header
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Compute::V1::VERSION,
                  transports_version_send: [:rest]

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     call_metadata

                uri, _body, query_string_params = transcode_delete request
                response = @client_stub.make_delete_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options
                )
                result = ::Google::Cloud::Compute::V1::Operation.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?
                result
              rescue ::Faraday::Error => e
                gapic_error = ::Gapic::Rest::Error.wrap_faraday_error e
                raise ::Google::Cloud::Error.from_error(gapic_error)
              end

              ##
              # Returns the specified TargetGrpcProxy resource in the given scope.
              #
              # @overload get(request, options = nil)
              #   Pass arguments to `get` via a request object, either of type
              #   {::Google::Cloud::Compute::V1::GetTargetGrpcProxyRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Compute::V1::GetTargetGrpcProxyRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #     Note: currently retry functionality is not implemented. While it is possible
              #     to set it using ::Gapic::CallOptions, it will not be applied
              #
              # @overload get(project: nil, target_grpc_proxy: nil)
              #   Pass arguments to `get` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param project [::String]
              #     Project ID for this request.
              #   @param target_grpc_proxy [::String]
              #     Name of the TargetGrpcProxy resource to return.
              # @yield [result, env] Access the result along with the Faraday environment object
              # @yieldparam result [::Google::Cloud::Compute::V1::TargetGrpcProxy]
              # @yieldparam response [::Faraday::Response]
              #
              # @return [::Google::Cloud::Compute::V1::TargetGrpcProxy]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              def get request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Compute::V1::GetTargetGrpcProxyRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = {}

                # Set x-goog-api-client header
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Compute::V1::VERSION,
                  transports_version_send: [:rest]

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     call_metadata

                uri, _body, _query_string_params = transcode_get request
                response = @client_stub.make_get_request(
                  uri:     uri,
                  options: options
                )
                result = ::Google::Cloud::Compute::V1::TargetGrpcProxy.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?
                result
              rescue ::Faraday::Error => e
                gapic_error = ::Gapic::Rest::Error.wrap_faraday_error e
                raise ::Google::Cloud::Error.from_error(gapic_error)
              end

              ##
              # Creates a TargetGrpcProxy in the specified project in the given scope using the parameters that are included in the request.
              #
              # @overload insert(request, options = nil)
              #   Pass arguments to `insert` via a request object, either of type
              #   {::Google::Cloud::Compute::V1::InsertTargetGrpcProxyRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Compute::V1::InsertTargetGrpcProxyRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #     Note: currently retry functionality is not implemented. While it is possible
              #     to set it using ::Gapic::CallOptions, it will not be applied
              #
              # @overload insert(project: nil, request_id: nil, target_grpc_proxy_resource: nil)
              #   Pass arguments to `insert` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param project [::String]
              #     Project ID for this request.
              #   @param request_id [::String]
              #     An optional request ID to identify requests. Specify a unique request ID so that if you must retry your request, the server will know to ignore the request if it has already been completed.
              #
              #     For example, consider a situation where you make an initial request and the request times out. If you make the request again with the same request ID, the server can check if original operation with the same request ID was received, and if so, will ignore the second request. This prevents clients from accidentally creating duplicate commitments.
              #
              #     The request ID must be a valid UUID with the exception that zero UUID is not supported (00000000-0000-0000-0000-000000000000).
              #   @param target_grpc_proxy_resource [::Google::Cloud::Compute::V1::TargetGrpcProxy, ::Hash]
              #     The body resource for this request
              # @yield [result, env] Access the result along with the Faraday environment object
              # @yieldparam result [::Google::Cloud::Compute::V1::Operation]
              # @yieldparam response [::Faraday::Response]
              #
              # @return [::Google::Cloud::Compute::V1::Operation]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              def insert request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Compute::V1::InsertTargetGrpcProxyRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = {}

                # Set x-goog-api-client header
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Compute::V1::VERSION,
                  transports_version_send: [:rest]

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     call_metadata

                uri, body, query_string_params = transcode_insert request
                response = @client_stub.make_post_request(
                  uri:     uri,
                  body:    body,
                  params:  query_string_params,
                  options: options
                )
                result = ::Google::Cloud::Compute::V1::Operation.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?
                result
              rescue ::Faraday::Error => e
                gapic_error = ::Gapic::Rest::Error.wrap_faraday_error e
                raise ::Google::Cloud::Error.from_error(gapic_error)
              end

              ##
              # Lists the TargetGrpcProxies for a project in the given scope.
              #
              # @overload list(request, options = nil)
              #   Pass arguments to `list` via a request object, either of type
              #   {::Google::Cloud::Compute::V1::ListTargetGrpcProxiesRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Compute::V1::ListTargetGrpcProxiesRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #     Note: currently retry functionality is not implemented. While it is possible
              #     to set it using ::Gapic::CallOptions, it will not be applied
              #
              # @overload list(filter: nil, max_results: nil, order_by: nil, page_token: nil, project: nil, return_partial_success: nil)
              #   Pass arguments to `list` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param filter [::String]
              #     A filter expression that filters resources listed in the response. The expression must specify the field name, a comparison operator, and the value that you want to use for filtering. The value must be a string, a number, or a boolean. The comparison operator must be either `=`, `!=`, `>`, or `<`.
              #
              #     For example, if you are filtering Compute Engine instances, you can exclude instances named `example-instance` by specifying `name != example-instance`.
              #
              #     You can also filter nested fields. For example, you could specify `scheduling.automaticRestart = false` to include instances only if they are not scheduled for automatic restarts. You can use filtering on nested fields to filter based on resource labels.
              #
              #     To filter on multiple expressions, provide each separate expression within parentheses. For example: ``` (scheduling.automaticRestart = true) (cpuPlatform = "Intel Skylake") ``` By default, each expression is an `AND` expression. However, you can include `AND` and `OR` expressions explicitly. For example: ``` (cpuPlatform = "Intel Skylake") OR (cpuPlatform = "Intel Broadwell") AND (scheduling.automaticRestart = true) ```
              #   @param max_results [::Integer]
              #     The maximum number of results per page that should be returned. If the number of available results is larger than `maxResults`, Compute Engine returns a `nextPageToken` that can be used to get the next page of results in subsequent list requests. Acceptable values are `0` to `500`, inclusive. (Default: `500`)
              #   @param order_by [::String]
              #     Sorts list results by a certain order. By default, results are returned in alphanumerical order based on the resource name.
              #
              #     You can also sort results in descending order based on the creation timestamp using `orderBy="creationTimestamp desc"`. This sorts results based on the `creationTimestamp` field in reverse chronological order (newest result first). Use this to sort resources like operations so that the newest operation is returned first.
              #
              #     Currently, only sorting by `name` or `creationTimestamp desc` is supported.
              #   @param page_token [::String]
              #     Specifies a page token to use. Set `pageToken` to the `nextPageToken` returned by a previous list request to get the next page of results.
              #   @param project [::String]
              #     Project ID for this request.
              #   @param return_partial_success [::Boolean]
              #     Opt-in for partial success behavior which provides partial results in case of failure. The default value is false and the logic is the same as today.
              # @yield [result, env] Access the result along with the Faraday environment object
              # @yieldparam result [::Google::Cloud::Compute::V1::TargetGrpcProxyList]
              # @yieldparam response [::Faraday::Response]
              #
              # @return [::Google::Cloud::Compute::V1::TargetGrpcProxyList]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              def list request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Compute::V1::ListTargetGrpcProxiesRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = {}

                # Set x-goog-api-client header
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Compute::V1::VERSION,
                  transports_version_send: [:rest]

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     call_metadata

                uri, _body, query_string_params = transcode_list request
                response = @client_stub.make_get_request(
                  uri:     uri,
                  params:  query_string_params,
                  options: options
                )
                result = ::Google::Cloud::Compute::V1::TargetGrpcProxyList.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?
                result
              rescue ::Faraday::Error => e
                gapic_error = ::Gapic::Rest::Error.wrap_faraday_error e
                raise ::Google::Cloud::Error.from_error(gapic_error)
              end

              ##
              # Patches the specified TargetGrpcProxy resource with the data included in the request. This method supports PATCH semantics and uses JSON merge patch format and processing rules.
              #
              # @overload patch(request, options = nil)
              #   Pass arguments to `patch` via a request object, either of type
              #   {::Google::Cloud::Compute::V1::PatchTargetGrpcProxyRequest} or an equivalent Hash.
              #
              #   @param request [::Google::Cloud::Compute::V1::PatchTargetGrpcProxyRequest, ::Hash]
              #     A request object representing the call parameters. Required. To specify no
              #     parameters, or to keep all the default parameter values, pass an empty Hash.
              #   @param options [::Gapic::CallOptions, ::Hash]
              #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
              #     Note: currently retry functionality is not implemented. While it is possible
              #     to set it using ::Gapic::CallOptions, it will not be applied
              #
              # @overload patch(project: nil, request_id: nil, target_grpc_proxy: nil, target_grpc_proxy_resource: nil)
              #   Pass arguments to `patch` via keyword arguments. Note that at
              #   least one keyword argument is required. To specify no parameters, or to keep all
              #   the default parameter values, pass an empty Hash as a request object (see above).
              #
              #   @param project [::String]
              #     Project ID for this request.
              #   @param request_id [::String]
              #     An optional request ID to identify requests. Specify a unique request ID so that if you must retry your request, the server will know to ignore the request if it has already been completed.
              #
              #     For example, consider a situation where you make an initial request and the request times out. If you make the request again with the same request ID, the server can check if original operation with the same request ID was received, and if so, will ignore the second request. This prevents clients from accidentally creating duplicate commitments.
              #
              #     The request ID must be a valid UUID with the exception that zero UUID is not supported (00000000-0000-0000-0000-000000000000).
              #   @param target_grpc_proxy [::String]
              #     Name of the TargetGrpcProxy resource to patch.
              #   @param target_grpc_proxy_resource [::Google::Cloud::Compute::V1::TargetGrpcProxy, ::Hash]
              #     The body resource for this request
              # @yield [result, env] Access the result along with the Faraday environment object
              # @yieldparam result [::Google::Cloud::Compute::V1::Operation]
              # @yieldparam response [::Faraday::Response]
              #
              # @return [::Google::Cloud::Compute::V1::Operation]
              #
              # @raise [::Google::Cloud::Error] if the REST call is aborted.
              def patch request, options = nil
                raise ::ArgumentError, "request must be provided" if request.nil?

                request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::Compute::V1::PatchTargetGrpcProxyRequest

                # Converts hash and nil to an options object
                options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

                # Customize the options with defaults
                call_metadata = {}

                # Set x-goog-api-client header
                call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                  lib_name: @config.lib_name, lib_version: @config.lib_version,
                  gapic_version: ::Google::Cloud::Compute::V1::VERSION,
                  transports_version_send: [:rest]

                options.apply_defaults timeout:      @config.timeout,
                                       metadata:     call_metadata

                uri, body, query_string_params = transcode_patch request
                response = @client_stub.make_patch_request(
                  uri:     uri,
                  body:    body,
                  params:  query_string_params,
                  options: options
                )
                result = ::Google::Cloud::Compute::V1::Operation.decode_json response.body, ignore_unknown_fields: true

                yield result, response if block_given?
                result
              rescue ::Faraday::Error => e
                gapic_error = ::Gapic::Rest::Error.wrap_faraday_error e
                raise ::Google::Cloud::Error.from_error(gapic_error)
              end

              ##
              # Configuration class for the TargetGrpcProxies REST API.
              #
              # This class represents the configuration for TargetGrpcProxies REST,
              # providing control over credentials, timeouts, retry behavior, logging.
              #
              # Configuration can be applied globally to all clients, or to a single client
              # on construction.
              #
              # # Examples
              #
              # To modify the global config, setting the timeout for all calls to 10 seconds:
              #
              #     ::Google::Cloud::Compute::V1::TargetGrpcProxies::Client.configure do |config|
              #       config.timeout = 10.0
              #     end
              #
              # To apply the above configuration only to a new client:
              #
              #     client = ::Google::Cloud::Compute::V1::TargetGrpcProxies::Client.new do |config|
              #       config.timeout = 10.0
              #     end
              #
              # @!attribute [rw] endpoint
              #   The hostname or hostname:port of the service endpoint.
              #   Defaults to `"compute.googleapis.com"`.
              #   @return [::String]
              # @!attribute [rw] credentials
              #   Credentials to send with calls. You may provide any of the following types:
              #    *  (`String`) The path to a service account key file in JSON format
              #    *  (`Hash`) A service account key as a Hash
              #    *  (`Google::Auth::Credentials`) A googleauth credentials object
              #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
              #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
              #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
              #    *  (`nil`) indicating no credentials
              #   @return [::Object]
              # @!attribute [rw] scope
              #   The OAuth scopes
              #   @return [::Array<::String>]
              # @!attribute [rw] lib_name
              #   The library name as recorded in instrumentation and logging
              #   @return [::String]
              # @!attribute [rw] lib_version
              #   The library version as recorded in instrumentation and logging
              #   @return [::String]
              # @!attribute [rw] timeout
              #   The call timeout in seconds.
              #   @return [::Numeric]
              #
              class Configuration
                extend ::Gapic::Config

                config_attr :endpoint,      "compute.googleapis.com", ::String
                config_attr :credentials,   nil do |value|
                  allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                  allowed.any? { |klass| klass === value }
                end
                config_attr :scope,         nil, ::String, ::Array, nil
                config_attr :lib_name,      nil, ::String, nil
                config_attr :lib_version,   nil, ::String, nil
                config_attr :timeout,       nil, ::Numeric, nil

                # @private
                def initialize parent_config = nil
                  @parent_config = parent_config unless parent_config.nil?

                  yield self if block_given?
                end
              end
            end
          end
        end
      end
    end
  end
end
