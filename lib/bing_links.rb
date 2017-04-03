bing = CognitiveBing.new(ENV['BING_KEY'])
puts 'fetching images from Bing'
start = Time.now

links = (0..3).map do |n|
  bing.params = { count: 50, offset: n * 50 }
  bing.search('Han Solo', 'image')[:value].map do |p|
    { p[:contentUrl] => p[:thumbnailUrl] }
  end
end.flatten

links.each do |link|
  Link.create(url: link.keys.first, thumbnail_url:link.values.first)
end

puts "Persisted #{links.size} links in #{Time.now - start} seconds."

