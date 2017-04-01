ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# CognitiveBing stub
require 'cognitivebing'
BingResult = Struct.new(:contentUrl, :thumbnailUrl)

class CognitiveBing
  def search(search_term, type)
    puts 'USING FAKE BING'
    thumb1 = BingResult.new('https://fakebing.com/thumb1.jpg')
    pic1 = BingResult.new('https://fakeimages.com/pic1.jpg', thumb1)
    thumb2 = BingResult.new('https://fakebing.com/thumb2.jpg')
    pic2 = BingResult.new('https://fakeimages.com/pic2.jpg', thumb2)

    { value: [pic1, pic2] }
  end
end

class ActiveSupport::TestCase
  fixtures :all
end
