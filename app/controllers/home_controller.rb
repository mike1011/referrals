class HomeController < ApplicationController
  def index
    if current_user.present?
      @user = current_user
    else
      redirect_to :new_user_session
    end
  end
end
