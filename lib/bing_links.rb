# frozen_string_literal: true

require 'active_record'
require 'json'
require 'net/http'
require 'uri'
require_relative '../app/models/application_record'
require_relative '../app/models/link'

Rails.logger.debug 'fetching images from Bing'
start = Time.zone.now

uri  = 'https://api.cognitive.microsoft.com'
path = '/bing/v7.0/images/search'
term = 'han solo'
uri = URI("#{uri}#{path}?q=#{CGI.escape(term)}&count=100")
request = Net::HTTP::Get.new(uri)
request['Ocp-Apim-Subscription-Key'] = ENV.fetch('BING_KEY', nil)

response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
  http.request(request)
end

parsed_json = JSON.parse(response.body)

links = parsed_json['value'].map do |p|
  { p['contentUrl'] => p['thumbnailUrl'] }
end

ActiveRecord::Base.transaction do
  links.each do |link|
    u = URI(link.keys.first)
    req = Net::HTTP::Get.new(uri)
    begin
      res = Net::HTTP.start(u.host, u.port, use_ssl: u.scheme == 'https', read_timeout: 10) do |http|
        http.request(req)
      end
      next if res.code.start_with? '4'
    rescue StandardError => e
      Rails.logger.debug { "Error #{e} for #{link}" }
      next
    end
    Link.create(url: link.keys.first, thumbnail_url: link.values.first)
  end
end

Rails.logger.debug { "Persisted #{links.size} links in #{Time.zone.now - start} seconds." }
