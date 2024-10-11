# frozen_string_literal: true

require 'test_helper'

##
class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get han default' do
    Link.create(id: 1, url: 'https://fakeimages.com/pic1.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb1.jpg')
    Link.create(id: 2, url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb2.jpg')

    get static_pages_han_url

    assert_response :success
    assert_select('img').each do |i|
      assert %w[https://fakeimages.com/pic1.jpg https://fakeimages.com/pic2.jpg].include? i.attributes['src'].value
    end
    assert_select('.quote').each do |q|
      assert_not q.text.empty?
    end
    assert_select('#tr_quote').each do |q|
      assert StaticPagesController::DANSKE_CITERE.values.include?(q.text.strip)
    end
  end

  test 'should get han svenska' do
    Link.create(id: 1, url: 'https://fakeimages.com/pic1.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb1.jpg')
    Link.create(id: 2, url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb2.jpg')

    get static_pages_han_url, params: { language: 'svenska' }

    assert_response :success
    assert_select('img').each do |i|
      assert %w[https://fakeimages.com/pic1.jpg https://fakeimages.com/pic2.jpg].include? i.attributes['src'].value
    end
    assert_select('.quote').each do |q|
      assert_not q.text.empty?
    end
    assert_select('#tr_quote').each do |q|
      assert StaticPagesController::SVENSKA_CITERE.values.include?(q.text.strip)
    end
  end

  test 'should get han dansk' do
    Link.create(id: 1, url: 'https://fakeimages.com/pic1.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb1.jpg')
    Link.create(id: 2, url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb2.jpg')

    get static_pages_han_url, params: { language: 'dansk' }

    assert_response :success
    assert_select('img').each do |i|
      assert %w[https://fakeimages.com/pic1.jpg https://fakeimages.com/pic2.jpg].include? i.attributes['src'].value
    end
    assert_select('.quote').each do |q|
      assert_not q.text.empty?
    end
    assert_select('#tr_quote').each do |q|
      assert StaticPagesController::DANSKE_CITERE.values.include?(q.text.strip)
    end
  end

  # this can fail and things can be ok -- rerun and/or debug
  test '#i_dansk' do
    as = ''
    os = ''
    100.times do
      as += 'a'
      os += 'o'
    end
    text = "H#{as}n S#{os}l#{os}"
    lower = StaticPagesController.new.send(:i_dansk, text.downcase)
    assert lower.include?('å') && lower.include?('ø')
    upper = StaticPagesController.new.send(:i_dansk, text.upcase)
    assert upper.include?('Å') && upper.include?('Ø')
  end

  test '#i_svensk' do
    as = ''
    os = ''
    100.times do
      as += 'a'
      os += 'o'
    end
    text = "H#{as}n S#{os}l#{os}"
    lower = StaticPagesController.new.send(:i_svenska, text.downcase)
    assert lower.include?('å') && lower.include?('ø')
    upper = StaticPagesController.new.send(:i_svenska, text.upcase)
    assert upper.include?('Å') && upper.include?('Ø')
  end

  test '#lang default' do
    assert_equal 'dansk', StaticPagesController.new.send(:language, nil)
  end

  test '#lang not default' do
    assert_equal 'svensk', StaticPagesController.new.send(:language, 'svensk')
  end

  test '#pictures with no pics' do
    assert_nil StaticPagesController.new.send(:picture)
  end
end
