class SplashController < ApplicationController
  def index
    redirect_to groups_path, notice: 'You are already logged in' if user_signed_in?
  end
end
