class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    date_today
    project_table
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
     if @project.save
      redirect_to projects_path, notice: 'プロジェクトが正常に作成されました。'
    else
      @projects = Project.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  private
    def project_params
      params.require(:project).permit(:client, :title, :status, :other_task, :task_deadline, :final_deadline, :final_deadline_not_applicable, :compensation, :url, :note)
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

    def project_table
      
    end
end
