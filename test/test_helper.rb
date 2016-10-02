ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# BingSearch stub
require 'bing-search'
BingResult = Struct.new(:media_url, :thumbnail)

module BingSearch
  def self.image(_text)
    puts 'USING FAKE BING'
    thumb1 = BingResult.new('https://fakebing.com/thumb1.jpg')
    pic1 = BingResult.new('https://fakeimages.com/pic1.jpg', thumb1)
    thumb2 = BingResult.new('https://fakebing.com/thumb2.jpg')
    pic2 = BingResult.new('https://fakeimages.com/pic2.jpg', thumb2)

    [pic1, pic2]
  end
end

class ActiveSupport::TestCase
  fixtures :all
end
