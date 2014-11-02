#require "fb_graph2"

class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all


  end

  def show
    @user = User.find(params[:id])
    @graph = FbGraph2::User.new(@user.uid).authenticate(session[:auth_token]).fetch

    @graph = @graph.friends.summary['total_count']

  end

end
