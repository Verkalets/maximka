class UsersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
    # For VK gender
    if @user.gender == "2"
    @user.gender = "male"
    elsif @user.gender == "1" 
    @user.gender = "female"
    elsif @user.gender == "0"
    @user.gender = "User did not select gender"    
    end  
=begin
    if @user.age != nil && @user.provider == 'facebook'
    current_year = DateTime.now.to_date.strftime("%Y").to_i
    current_month = DateTime.now.to_date.strftime("%m").to_i
    current_day = DateTime.now.to_date.strftime("%d").to_i
    current_total_days = current_day + current_month*30 + current_year*365
    
    usrs_year = @user.age.strftime("%Y").to_i
    usrs_month = @user.age.strftime("%d").to_i
    usrs_day = @user.age.strftime("%m").to_i
    usrs_total_days = usrs_day + usrs_month*30 + usrs_year*365

    @user_age = (current_total_days - usrs_total_days)/365
    
    elsif @user.age != nil && @user.provider == 'vkontakte'
    current_year = DateTime.now.to_date.strftime("%Y").to_i
    current_month = DateTime.now.to_date.strftime("%m").to_i
    current_day = DateTime.now.to_date.strftime("%d").to_i
    current_total_days = current_day + current_month*30 + current_year*365

    
    usrs_year = @user.age.strftime("%Y").to_i
    usrs_month = @user.age.strftime("%m").to_i
    usrs_day = @user.age.strftime("%d").to_i
    usrs_total_days = usrs_day + usrs_month*30 + usrs_year*365

    @user_age = (current_total_days - usrs_total_days)/365 
    end
=end
  
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
