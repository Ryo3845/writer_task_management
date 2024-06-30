require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar1234", password_confirmation: "foobar1234")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "name should not be longer than 21 characters" do
    @user.name = "a" * 21
    assert_not @user.valid?
  end

  test "email should not be longer than 255 characters" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    vaild_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    vaild_addresses.each do |vaild_address|
      @user.email = vaild_address
      assert @user.valid?, "#{vaild_address.inspect} should be valid"
    end
  end

  test "email validation should recect invalid addresses" do
    invaild_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invaild_addresses.each do |invaild_address|
      @user.email = invaild_address
      assert_not @user.valid?, "#{invaild_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lowercase" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 10
    assert_not @user.valid?
  end

  test "passoword should be long more than 10 characters" do
    @user.password = @user.password_confirmation = "a" * 9
    assert_not @user.valid?
  end

  test "password should not consist of only letters" do
    @user.password = @user.password_confirmation = "a" * 10
    assert_not @user.valid?
  end

  test "password should not consist of only numbers" do
    @user.password = @user.password_confirmation = "1" * 10
    assert_not @user.valid?
  end

  test "passoword should be a combination of letters and numbers" do
    @user.password = @user.password_confirmation = "a" * 5 + "1" * 5
    assert @user.valid?
  end
end
