module DashboardHelper
  
  def get_age_string
    @users = User.all
    
    @string = ''
    @users.each do |u|
      @string = @string + u.age.to_s + ':'
    end
    
    return @string.to_s + "0"
  end

  def get_user_count_string
    @users_count = User.all.count
  end
  
end
