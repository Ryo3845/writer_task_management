require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "password1234", password_confirmation: "password1234")
  end

  test "authenticated? should return false for a user with nil digest"  do
    assert_not @user.authenticated?('')
  end
end
