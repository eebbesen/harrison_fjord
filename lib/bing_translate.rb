# Getting frequent BingTranslator::Exception ((s:Client) TranslateApiException: Cannot find an active Azure Market Place Translator Subscription associated with the request credentials. : ID=0824.V2_Soap.Translate.51F893D7)
# so not calling per request

t = BingTranslator.new(ENV['BING_CLIENT'], ENV['BING_SECRET'], false, ENV['BING_KEY'])
qq = StaticPagesController::DANSKE_CITERE.map { |q| q }
res = {}
errors = 0
start = Time.now

until qq.empty?
  sleep 7
  q = qq.last
  begin
    k = q[0]
    res[k] = t.translate(k, from: 'en', to: 'sv')
    puts "translated: #{k}"
  rescue => ex
    puts "#{k}: #{ex.message}"
    errors += 1
    sleep 7
    retry
  end
  qq.pop
  sleep 7
end

puts "Translated #{res.size} values with #{errors.size} errors in #{Time.now - start} seconds."
