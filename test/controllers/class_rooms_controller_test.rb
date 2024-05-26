require "test_helper"

class ClassRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get class_rooms_index_url
    assert_response :success
  end

  test "should get show" do
    get class_rooms_show_url
    assert_response :success
  end
end
