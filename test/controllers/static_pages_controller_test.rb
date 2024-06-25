require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "WriterTask"
    @hp_title = "WriterTask ライター案件管理ツール"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", @hp_title
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "運営者 | #{@base_title}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "お問い合わせ | #{@base_title}"
  end
end
