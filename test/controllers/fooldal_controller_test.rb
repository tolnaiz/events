require 'test_helper'

class FooldalControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should respond to /" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "/event should redirect to" do
    get :event, id: 1
    assert_redirected_to "http://www.facebook.com/" + 158807571159114.to_s
  end
end
