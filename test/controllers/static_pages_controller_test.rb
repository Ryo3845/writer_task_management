require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "WriterTask"
    @home_title = "WriterTask - ライター案件管理ツール"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", @home_title
  end

  test "should get function" do
    get function_path
    assert_response :success
    assert_select "title", "機能 | #{@base_title}"
  end

  test "should get pricing" do
    get pricing_path
    assert_response :success
    assert_select "title", "料金 | #{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "お問い合わせ | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "運営者 | #{@base_title}"
  end
end
