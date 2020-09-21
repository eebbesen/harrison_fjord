require 'savon'

class MyConfig
  def wsdl; "NotificationBroker.wsdl"; end
  def base; "base"; end
end


# Main module
module Surv
  class Client
    attr_accessor :topics
    attr_reader :client, :config

    def initialize(config)
      @topics = Hash.new

      #$stderr.puts("Entry point is #{config.proto}://#{config.site}:#{config.port}/#{config.entry}.")

      client = Savon.client(wsdl: config.wsdl,
                            strip_namespaces: false,
                            log_level: :info,
                            convert_request_keys_to: :camelcase,
                            #pretty_print_xml: true,
      )

      #$stderr.puts("Entry point: #{client.wsdl.endpoint}")
      $stderr.puts("Init done.")
      $stderr.puts("Available methods: #{client.operations}")
      @client = client
      @config = config
    end

    def subscribe(topic, callback="callback")
      my_topic = "#{@config.base}/#{callback}"
      message = {
          ConsumerReference: {
            Address: my_topic,
          },
          Filter: {
              TopicExpression: topic,
          },
      }

      $stderr.puts(message)
      $stderr.puts("  Subscribing #{my_topic} for #{topic}")

      # @topics[callback] = Topic.new(callback)
      # @topics[callback].bytes = 0
      # @topics[callback].pkts = 0

      begin
        resp = client.call(:subscribe, message: message)
      rescue Savon::Error => error
        $stderr.puts("Error: #{error.http.code} #{error}")
      else
        puts "ZOMG request was successful??? #{resp}"
      end
    end
  end
end


Surv::Client.new(MyConfig.new).subscribe('AsterixJSONGzipped')
