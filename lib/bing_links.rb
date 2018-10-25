require 'active_record'
require 'json'
require 'net/http'
require 'uri'
require_relative '../app/models/application_record'
require_relative '../app/models/link'

puts 'fetching images from Bing'
start = Time.now

uri  = "https://api.cognitive.microsoft.com"
path = "/bing/v7.0/images/search"
term = 'han solo'
uri = URI(uri + path + "?q=" + URI.escape(term) + '&count=100')
request = Net::HTTP::Get.new(uri)
request['Ocp-Apim-Subscription-Key'] = ENV['BING_KEY']

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
  http.request(request)
end

parsed_json = JSON.parse(response.body)

links = parsed_json['value'].map do |p|
  { p['contentUrl'] => p['thumbnailUrl'] }
end

links.each do |link|
  Link.create(url: link.keys.first, thumbnail_url: link.values.first)
end

puts "Persisted #{links.size} links in #{Time.now - start} seconds."
