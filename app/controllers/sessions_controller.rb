class SessionsController < ApplicationController
  before_filter :require_login, :only => :destroy

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    render :new and return if @user.blank?

    redirect_to home_path, :notice => "Logged in"
  end

  def destroy
    logout

    redirect_to home_path, :notice => "Logged out"
  end
end

