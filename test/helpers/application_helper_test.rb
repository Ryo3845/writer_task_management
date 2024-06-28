require "test_helper"

class ApplicationHelperTest < ActionView::TestCase

  test "full title hepler" do
    assert_equal "WriterTask - ライター案件管理ツール", full_title
    assert_equal "ヘルプ | WriterTask", full_title("ヘルプ")
  end
end
