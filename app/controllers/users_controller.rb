#require "fb_graph2"

class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def show
    @admin_page = '287264701345901'


    @user = User.find(params[:id])
    @graph = FbGraph2::User.new(@user.uid).authenticate(session[:auth_token]).fetch

    if @graph.posts[0].raw_attributes['story_tags']['22'].present?
      @last_post_id= @graph.posts[0].raw_attributes['story_tags']['22'][0]['id']
    else
      @last_post_id= @graph.posts[0].raw_attributes
    end

    @friends_count = @graph.friends.summary['total_count']
    @gender = @graph.gender
    @age = @graph.birthday
    @user.add_data_to_profile(@friends_count, @gender, @age)
  end

end
