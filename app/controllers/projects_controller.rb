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
      @this_month = @today.month
      @this_day = @today.day

      # プルダウンから年月を取得するか、現在の年月をデフォルトとして表示
      @year = params[:year].present? ? params[:year].to_i : @this_year
      @month = params[:month].present? ? params[:month].to_i : @this_month

      # プルダウンで表示される年月
      @selected_month = Date.new(@year, @month)

      # プルダウンで選択された年月の、最初の日と最後の日を取得
      @first_day = @selected_month.beginning_of_month
      @last_day = @selected_month.end_of_month

      # プルダウンで選択された年月の日付を配列に格納
      @calendar_data = []
      (@first_day..@last_day).each do |date|
        @calendar_data << {
          date: date,
          month: date.month,
          day: date.day,
          wday: date.wday,
          today: date == @today
        }
      end

      # プルダウン用の年月の選択肢を用意
      @years = (2024..2030).to_a
      @months = (1..12).to_a
    end
end
