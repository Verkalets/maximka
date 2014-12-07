class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

  def add_data_to_profile(friends_count, gender, age)
    @age = age
    @gender = gender
    @friends_count = friends_count
    
    if @age == 1
      self.friends_count = @friends_count
      self.gender = @gender
      self.age = Time.now.to_date.year - @age.to_date.year
      self.save
    else
      self.age = 0
    end
  end

end
