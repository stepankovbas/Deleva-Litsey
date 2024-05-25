require "application_system_test_case"

class SchoolNewsTest < ApplicationSystemTestCase
  setup do
    @school_news = school_news(:one)
  end

  test "visiting the index" do
    visit school_news_url
    assert_selector "h1", text: "School news"
  end

  test "should create school news" do
    visit school_news_url
    click_on "New school news"

    fill_in "Content", with: @school_news.content
    fill_in "Description", with: @school_news.description
    fill_in "Photo", with: @school_news.photo
    fill_in "Title", with: @school_news.title
    click_on "Create School news"

    assert_text "School news was successfully created"
    click_on "Back"
  end

  test "should update School news" do
    visit school_news_url(@school_news)
    click_on "Edit this school news", match: :first

    fill_in "Content", with: @school_news.content
    fill_in "Description", with: @school_news.description
    fill_in "Photo", with: @school_news.photo
    fill_in "Title", with: @school_news.title
    click_on "Update School news"

    assert_text "School news was successfully updated"
    click_on "Back"
  end

  test "should destroy School news" do
    visit school_news_url(@school_news)
    click_on "Destroy this school news", match: :first

    assert_text "School news was successfully destroyed"
  end
end
