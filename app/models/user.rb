class User < ActiveRecord::Base

  def self.create_with_fb_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth.info.name || ""
        user.gender = auth.extra.raw_info.gender || ""
        user.age = auth.extra.raw_info.birthday || ""
      end
    end
  end
  
  def self.create_with_vk_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth.info.name || ""
        user.gender = auth.extra.raw_info.sex || ""
        user.age = auth.extra.raw_info.bdate || ""
      end
    end
  end  

    


end
