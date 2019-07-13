class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :load_user, only: %i(show edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: %i(destroy)

  def index
    @users = User.activated.page(params[:page]).per Settings.num_users_per_page
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      @user.send_activation_email
      flash[:info] = t "mail_check_message"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @microposts = @user.microposts.create_desc.page(params[:page]).per Settings.num_feeds_per_page
    redirect_to(root_url) && return unless @user.activated?
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "profile_updated_message"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.admin?
      flash[:danger] = t"cannot_delete_admin"
    elsif @user.destroy
      flash[:success] = t "user_deleted_message"
    else
      flash[:danger] = t"cannot_deleted"
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email,
      :password, :password_confirmation
  end

  def correct_user
    return if current_user? @user
    flash[:danger] = t ".danger"
    redirect_to root_url
  end

  def admin_user
    return if current_user.admin?
    flash[:danger] = t ".danger"
    redirect_to root_url
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end
end
