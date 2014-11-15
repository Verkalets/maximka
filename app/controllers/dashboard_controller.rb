class DashboardController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
  end

  def show
  end

  def setting
  end
end
