class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end
  
  def new_vk
    redirect_to '/auth/vkontakte'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_fb_omniauth(auth)
      
    session[:auth_token] = auth.credentials.token
    if user.provider === 'facebook' 
    @graph = FbGraph2::User.new(user.uid).authenticate(session[:auth_token]).fetch
    friends_count_graph = @graph.friends.summary['total_count']
    user.update_attributes(friends_count: friends_count_graph)
    end
    reset_session
    session[:user_id] = user.id
    session[:auth_token] = auth.credentials.token
    redirect_to visitors_access_url, :notice => 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
  
  def vkontakte
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_vk_omniauth(auth)
    session[:auth_token] = auth.credentials.token
    vk = VkontakteApi::Client.new(session[:auth_token])
    friends_count_vk = vk.friends.get(fields: [:count]).size
    user.update_attributes(friends_count: friends_count_vk)                   
    reset_session
    session[:user_id] = user.id
    session[:auth_token] = auth.credentials.token
    redirect_to visitors_access_url, :notice => 'Signed in!'
  end

end
