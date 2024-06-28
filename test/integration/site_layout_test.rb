require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", function_path
    assert_select "a[href=?]", pricing_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", about_path
    get function_path
    assert_select "title", full_title("機能")
    # get pricing_path
    # assert_select "title", full_title("料金")
    # get signup_path
    # assert_select "title", full_title("新規登録")
    # get help_path
    # assert_select "title", full_title("ヘルプ")
    # get contact_path
    # assert_select "title", full_title("お問い合わせ")
    # get about_path
    # assert_select "title", full_title("運営者")
  end
end
