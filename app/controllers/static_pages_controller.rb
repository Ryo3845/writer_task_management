class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to projects_path
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def function
  end

  def pricing
  end
end
