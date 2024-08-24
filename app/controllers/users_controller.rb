class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  # 新しいユーザーを作成する（新規登録）
  def new
    @user = User.new
  end

  # ユーザーでログインする
  def create
    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      redirect_to projects_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # ユーザー情報を編集するページを表示する
  def edit
    @user = User.find(params[:id])
  end

  # ユーザー情報を更新する
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 成功した場合に取り扱う
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
