class UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end

  def show
    #@admin_page = '287264701345901'
    # Get user data
    @user = User.find(params[:id])


    # Add Data into DB
    
    if @user.provider === 'facebook'
      @graph = FbGraph2::User.new(@user.uid).authenticate(session[:auth_token]).fetch
    
      @friends_count = @graph.friends.summary['total_count']
      @gender = @graph.gender
      @age = @graph.birthday
      # @user.add_data_to_profile(@friends_count, @gender, @age) #Get Data
    elsif @user.provider = 'vkontakte'
    end
    
    ## Post into feed
    
    #@me = FbGraph2::User.me(session[:auth_token])
    #@me.feed!(
    #  :message => 'Updating via FbGraph',
    #  :picture => 'https://graph.facebook.com/matake/picture',
    #  :link => 'https://github.com/nov/fb_graph',
    #  :name => 'FbGraph',
    #  :description => 'A Ruby wrapper for Facebook Graph API'
    #)
    
  end

end
