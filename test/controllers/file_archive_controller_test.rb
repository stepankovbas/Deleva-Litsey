require "test_helper"

class FileArchiveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get file_archive_index_url
    assert_response :success
  end

  test "should get show" do
    get file_archive_show_url
    assert_response :success
  end
end
