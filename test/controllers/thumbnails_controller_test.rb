# frozen_string_literal: true

require 'test_helper'

class ThumbnailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Link.create(id: 1, url: 'https://fakeimages.com/pic1.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb1.jpg')
    Link.create(id: 2, url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb2.jpg')
    Link.create(id: 3, url: 'https://fakeimages.com/pic3.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb3.jpg')
  end

  test 'should retrieve pictures' do
    exp1 = '<img id="1" class="photo col" src="https://fakeimages.com/pic_thumb1.jpg"/>'
    exp2 = '<img id="2" class="photo col" src="https://fakeimages.com/pic_thumb2.jpg"/>'
    exp3 = '<img id="3" class="photo col" src="https://fakeimages.com/pic_thumb3.jpg"/>'

    get t_path

    assert_response :success
    [exp1, exp2, exp3].each { |e| assert_match e, response.body }
  end

  test 'should order retrieved pictures' do
    Link.create(id: 4, url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb4.jpg')

    get t_path

    assert_response :success
    assert_match /pic_thumb1.*pic_thumb2.*pic_thumb4.*pic_thumb3/m, response.body
  end

  test 'should delete selected links with valid delete key' do
    ENV['DELETE_KEY'] = 'deletedelete'
    delete thumbnails_destroy_path, params: { markedForDelete: '-1,1,3' , deleteKey: 'deletedelete'}

    assert_response :redirect
    assert_redirected_to t_path
    assert_equal 1, Link.count
    assert_equal 2, Link.all.first.id
  end

  test 'should not delete selected links without valid delete key' do
    delete thumbnails_destroy_path, params: { markedForDelete: '-8' }

    assert_response :no_content
    assert_equal 3, Link.count
  end

  test 'should noop when nothing selected' do
    ENV['DELETE_KEY'] = 'deletedelete'
    delete thumbnails_destroy_path, params: { markedForDelete: '-1' , deleteKey: 'deletedelete'}

    assert_response :redirect
    assert_redirected_to t_path
    assert_equal 3, Link.count
  end
end
