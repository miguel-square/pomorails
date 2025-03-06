class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @pomodoros = @user.pomodoros.order(created_at: :desc).limit(10)
  end
end
