class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後に、進捗管理のページにリダイレクトする
    else
      flash[:danger] = "メールアドレスまたはパスワードが間違っています"
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end
end
