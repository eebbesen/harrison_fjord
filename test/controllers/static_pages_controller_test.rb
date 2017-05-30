require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get han' do
    Link.create(id: 1, url: 'https://fakeimages.com/pic1.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb1.jpg')
    Link.create(id: 2, url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb2.jpg')

    get static_pages_han_url

    assert_response :success
    assert_select('img').each do |i|
      assert ['1','2'].include? i.attributes['src'].value
    end
    assert_select('.quote').each do |q|
      assert !q.text.empty?
    end
  end

  # this can fail and things can be ok -- rerun and/or debug
  test '#i_dansk' do
    text = 'Haaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaan Sooooooooooooooooooooooooooooooooooooooooooooooooloooo'
    lower = StaticPagesController.new.send(:i_dansk, text.downcase)
    assert lower.include?('å') && lower.include?('ø')
    upper = StaticPagesController.new.send(:i_dansk, text.upcase)
    assert upper.include?('Å') && upper.include?('Ø')
  end

  test '#lang default' do
    assert_equal 'dansk', StaticPagesController.new.send(:language, nil)
  end

  test '#lang not default' do
    c = StaticPagesController.new
    assert_equal 'svensk', StaticPagesController.new.send(:language, 'svensk')
  end
end
