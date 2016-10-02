require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get han' do
    get static_pages_han_url

    assert_response :success
    assert_select('img').each do |i|
      assert_equal 'https://fakeimages.com/pic1.jpg', i.attributes['src'].value
    end
    assert_select('.quote').each do |q|
      assert !q.text.empty?
    end
  end

  test 'i_dansk' do
    assert_equal 'Hån Sølø', StaticPagesController.new.send(:i_dansk, 'Han Solo')
    assert_equal 'HÅN SØLØ', StaticPagesController.new.send(:i_dansk, 'HAN SOLO')
  end
end
