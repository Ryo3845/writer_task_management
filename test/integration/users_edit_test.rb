require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "", email: "foo@invalid", password: "foo12", password_digest: "bar34" } }
    assert_template 'users/edit'
    assert_select 'div#error_explanation ul li', 4
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'user/edit'
    name = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name: name, email: email, password: "", password_digest: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
