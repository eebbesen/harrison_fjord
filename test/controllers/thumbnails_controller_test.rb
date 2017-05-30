require 'test_helper'

class ThumbnailsControllerTest < ActionDispatch::IntegrationTest
  test 'should delete selected links' do
    Link.create(url: 'https://fakeimages.com/pic1.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb1.jpg')
    Link.create(url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb2.jpg')
    Link.create(url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb3.jpg')

    delete thumbnails_destroy_path, markedForDelete: '-1,1,3'

    assert_response :redirect
    assert_redirected_to t_path
    assert_equal 1, Link.count
    assert_equal 2, Link.all.first.id
  end
  test 'should noop when nothing selected' do
    Link.create(url: 'https://fakeimages.com/pic1.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb1.jpg')
    Link.create(url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb2.jpg')
    Link.create(url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb3.jpg')

    delete thumbnails_destroy_path, markedForDelete: '-1'

    assert_response :redirect
    assert_redirected_to t_path
    assert_equal 3, Link.count
  end
end
