require 'test_helper'

class ThumbnailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Link.create(id: 1, url: 'https://fakeimages.com/pic1.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb1.jpg')
    Link.create(id: 2, url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb2.jpg')
    Link.create(id: 3, url: 'https://fakeimages.com/pic2.jpg', thumbnail_url: 'https://fakeimages.com/pic_thumb3.jpg')
  end

  test 'should retrieve pictures' do
    exp1 = "<img id=\"1\" class=\"photo col\" src=\"https://fakeimages.com/pic_thumb1.jpg\" onclick=\"selectImage(this);\"/>"
    exp2 = "<img id=\"2\" class=\"photo col\" src=\"https://fakeimages.com/pic_thumb2.jpg\" onclick=\"selectImage(this);\"/>"
    exp3 = "<img id=\"3\" class=\"photo col\" src=\"https://fakeimages.com/pic_thumb3.jpg\" onclick=\"selectImage(this);\"/>"

    get t_path

    assert_response :success
    [exp1, exp2, exp3].each { |e| assert_match e, response.body }
  end

  test 'should delete selected links' do
    delete thumbnails_destroy_path, markedForDelete: '-1,1,3'

    assert_response :redirect
    assert_redirected_to t_path
    assert_equal 1, Link.count
    assert_equal 2, Link.all.first.id
  end
  
  test 'should noop when nothing selected' do
    delete thumbnails_destroy_path, markedForDelete: '-1'

    assert_response :redirect
    assert_redirected_to t_path
    assert_equal 3, Link.count
  end
end
