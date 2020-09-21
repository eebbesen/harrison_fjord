# encoding: utf-8
# This file is distributed under New Relic's license terms.
# See https://github.com/newrelic/rpm/blob/master/LICENSE for complete details.

module NewRelic
  module Agent
    module HTTPClients
      class NetHTTPRequest
        def initialize(connection, request)
          @connection = connection
          @request = request
        end

        NET_HTTP = 'Net::HTTP'.freeze

        def type
          NET_HTTP
        end

        HOST = 'host'.freeze
        COLON = ':'.freeze

        def host_from_header
          if hostname = self[HOST]
            hostname.split(COLON).first
          end
        end

        def host
          host_from_header || @connection.address
        end

        def method
          @request.method
        end

        def [](key)
          @request[key]
        end

        def []=(key, value)
          @request[key] = value
        end

        def uri
          case @request.path
          when /^https?:\/\//
            URI(@request.path)
          else
            scheme = @connection.use_ssl? ? 'https' : 'http'
            URI("#{scheme}://#{@connection.address}:#{@connection.port}#{@request.path}")
          end
        end
      end
    end
  end
end
