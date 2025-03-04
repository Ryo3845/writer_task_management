class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    date_today
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
      @today = Date.today
      @wday_jan = ["日","月","火","水","木","金","土"]
      @this_year = @today.year
      @this_year = @today.year

      # 今月の最初の日と最後の日を取得
      @first_day = @today.beginning_of_month
      @last_day = @today.end_of_month

      # 今月の合計日数を取得
      @days_in_the_month = (@first_day..@last_day).count

      # 今月の日付を配列に格納
      @calendar_data = []
      (@first_day..@last_day).each do |date|
        @calendar_data << {
          date: date,
          year: date.year,
          month: date.month,
          day: date.day,
          wday: date.wday,
          today: date == @today
        }
      end
    end
end
