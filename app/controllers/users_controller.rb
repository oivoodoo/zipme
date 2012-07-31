class UsersController < ApplicationController
  respond_to :html

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save

    auto_login(@user)

    respond_with @user, :location => home_path, :notice => "Signed up!"
  end
end

