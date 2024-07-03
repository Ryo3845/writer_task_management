require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "WriterTask"
  end

  test "should get index" do
    get projects_path
    assert_response :success
    assert_select "title", "#{Date.today.strftime('%Y年%m月')}の案件一覧 | #{@base_title}"
  end
end
