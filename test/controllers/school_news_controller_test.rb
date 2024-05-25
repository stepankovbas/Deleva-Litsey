require "test_helper"

class SchoolNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_news = school_news(:one)
  end

  test "should get index" do
    get school_news_index_url
    assert_response :success
  end

  test "should get new" do
    get new_school_news_url
    assert_response :success
  end

  test "should create school_news" do
    assert_difference("SchoolNews.count") do
      post school_news_index_url, params: { school_news: { content: @school_news.content, description: @school_news.description, photo: @school_news.photo, title: @school_news.title } }
    end

    assert_redirected_to school_news_url(SchoolNews.last)
  end

  test "should show school_news" do
    get school_news_url(@school_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_school_news_url(@school_news)
    assert_response :success
  end

  test "should update school_news" do
    patch school_news_url(@school_news), params: { school_news: { content: @school_news.content, description: @school_news.description, photo: @school_news.photo, title: @school_news.title } }
    assert_redirected_to school_news_url(@school_news)
  end

  test "should destroy school_news" do
    assert_difference("SchoolNews.count", -1) do
      delete school_news_url(@school_news)
    end

    assert_redirected_to school_news_index_url
  end
end
