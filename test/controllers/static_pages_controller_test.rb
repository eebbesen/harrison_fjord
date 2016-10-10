require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get han' do
    get static_pages_han_url

    assert_response :success
    assert_select('img').each do |i|
      assert_match /https:\/\/fakeimages\.com\/pic.\.jpg/, i.attributes['src'].value
    end
    assert_select('.quote').each do |q|
      assert !q.text.empty?
    end
  end

  # this can fail and things can be ok -- rerun and/or debug
  test 'i_dansk' do
    text = 'Haaaaaaaaaaaaaaaaaaaan Soooooooooooooooooooooloooo'
    lower = StaticPagesController.new.send(:i_dansk, text.downcase)
    assert lower.include?('å') && lower.include?('ø')
    upper = StaticPagesController.new.send(:i_dansk, text.upcase)
    assert upper.include?('Å') && upper.include?('Ø')
  end
end
