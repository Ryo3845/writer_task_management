class ProjectsController < ApplicationController

  def index
    @project = Project.new
    @projects = current_user.projects
    @tasks = current_user.tasks
    date_today
    remaining_days

  # 最初の3つのプロジェクトは常に表示
  @always_visible_projects = @projects.limit(3)

  # 4つ目以降はprojectsテーブルにレコードがある限り表示
  @conditional_projects = @projects.offset(3)
  end

  def show
    @project = current_user.projects.find(params[:id])
    @tasks = current_user.tasks
  end

  def new
    @project = Project.new
    @project.tasks.build
    @process_options = Task.distinct.pluck(:process).compact
  end

  def create
    @project = current_user.projects.build(project_params)
     if @project.save
      redirect_to projects_path, notice: '案件が正しく登録されました'
    else
      @projects = current_user.projects
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
    @task = current_user.tasks.find(params[:id])
    @tasks = current_user.tasks
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy!
    redirect_to projects_path, notice: '案件が削除されました'
  end

  private
    def project_params
      params.require(:project).permit(:client, :project, :process, :start_date, :due_date, :task_deadline, :rewards, tasks_attributes: [:task, :due_date, :task_url, :notes])
    end

    # タスクのステータスリスト
    def status_list
      @status_list = [@tasks.status]
    end

    def date_today
      # 基準日を設定（デフォルトは今月）
      @today = Date.today
      @base_date = params[:base_date].present? ? Date.parse(params[:base_date]) : @today

      # 基準月の最初と最後の日を取得
      @current_month_first_day = @base_date.beginning_of_month
      @current_month_last_day = @base_date.end_of_month
      @next_month_first_day = @current_month_first_day.next_month
      @next_month_last_day = @next_month_first_day.end_of_month

      # 日付の設定
      @wday_jan = ["日","月","火","水","木","金","土"]
      @current_month = @current_month_first_day.month
      @next_month = @next_month_first_day.month
      @current_year = @current_month_first_day.year
      @next_year = @next_month_first_day.year

      # 月の合計日数を取得
      @current_days_in_month = (@current_month_first_day..@current_month_last_day).count
      @next_days_in_month = (@next_month_first_day..@next_month_last_day).count

      # 基準月の日付を配列に格納
      @current_calendar_data = []
      (@current_month_first_day..@current_month_last_day).each do |date|
        @current_calendar_data << {
          date: date,
          year: date.year,
          month: date.month,
          day: date.day,
          wday: date.wday,
          today: date == @today
        }
      end

      # 次月の日付を配列に格納
      @next_calendar_data = []
      (@next_month_first_day..@next_month_last_day).each do |date|
        @next_calendar_data << {
          date: date,
          year: date.year,
          month: date.month,
          day: date.day,
          wday: date.wday,
          today: date == @today
        }
      end

      # 基準月から2か月分の日付を格納
      @two_months_calendar_data = @current_calendar_data + @next_calendar_data
    end

    def remaining_days
      #工程の残り納期への日数を計算
      # @remaining_days =
    end

    def set_project
      @project = Projects.find(params[:id])
    end
end
