# frozen_string_literal: true

# Getting frequent BingTranslator::Exception ((s:Client) TranslateApiException: Cannot find an active Azure Market Place Translator Subscription associated with the request credentials. : ID=0824.V2_Soap.Translate.51F893D7)
# so not calling per request

t = BingTranslator.new(ENV.fetch('BING_CLIENT', nil), ENV.fetch('BING_SECRET', nil), false, ENV.fetch('BING_KEY', nil))
qq = StaticPagesController::DANSKE_CITERE.map { |q| q }
res = {}
errors = 0
start = Time.zone.now

until qq.empty?
  sleep 7
  q = qq.last
  begin
    k = q[0]
    res[k] = t.translate(k, from: 'en', to: 'sv')
    Rails.logger.debug { "translated: #{k}" }
  rescue StandardError => e
    Rails.logger.debug { "#{k}: #{e.message}" }
    errors += 1
    sleep 7
    retry
  end
  qq.pop
  sleep 7
end

Rails.logger.debug { "Translated #{res.size} values with #{errors.size} errors in #{Time.zone.now - start} seconds." }
