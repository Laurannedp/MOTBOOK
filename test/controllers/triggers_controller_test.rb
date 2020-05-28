require 'test_helper'

class TriggersControllerTest < ActionDispatch::IntegrationTest
  test "should get name:string" do
    get triggers_name:string_url
    assert_response :success
  end

  test "should get url:string" do
    get triggers_url:string_url
    assert_response :success
  end

end
