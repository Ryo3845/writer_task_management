require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "", email: "user@invalid", password: "pass", password_confirmation: "word" } }
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end

  test "valid signup information" do
    assert_difference "User.count" do
      post users_path, params: { user: { name: "Example User", email: "example@example.com", password: "password1234", password_confirmation: "password1234" } }
    end
    follow_redirect!
    assert_template 'projects/index'
    assert is_logged_in?
  end
end
