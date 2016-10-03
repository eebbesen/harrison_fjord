# Getting frequent BingTranslator::Exception ((s:Client) TranslateApiException: Cannot find an active Azure Market Place Translator Subscription associated with the request credentials. : ID=0824.V2_Soap.Translate.51F893D7)
# so not calling per request

qq = StaticPagesController::QUOTES.map { |q| q }
res = {}

while qq.size > 0
  sleep 7
  q = qq.last
  begin
    t = BingTranslator.new(ENV['BING_CLIENT'], ENV['BING_SECRET'], false, ENV['BING_KEY'])
    res[q] = t.translate(q, from: 'en', to: 'da')
  rescue => ex
    puts "#(q}: #{ex.message}"
    sleep 5
    retry
  end
  qq.pop
  sleep 7
end
