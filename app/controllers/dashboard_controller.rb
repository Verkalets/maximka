class DashboardController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end

  def show
  end
  
  def statistic
    @users = User.all
  end

  def setting
  end
end
