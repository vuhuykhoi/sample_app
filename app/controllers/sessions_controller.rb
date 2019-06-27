class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate(params[:session][:password])
      log_in user
      check_remember_box user
      redirect_to user
    else
      flash.now[:danger] = t("invalid_user_infor")
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def check_remember_box user
    if params[:session][:remember_me] == Settings.remember_box.is_checked
      remember user
    else
      forget user
    end
  end
end
