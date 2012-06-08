require 'test_helper'
#copied from book
class PlayControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
