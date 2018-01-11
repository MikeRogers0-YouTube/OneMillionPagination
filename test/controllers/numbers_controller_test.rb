require 'test_helper'

class NumbersControllerTest < ActionDispatch::IntegrationTest
  test 'Renders successfully' do
    get numbers_path
    assert_response :success
  end

  test 'Renders successfully when passed per_page and page params' do
    get numbers_path(per_page: 25, page: 1)
    assert_response :success
  end
end
