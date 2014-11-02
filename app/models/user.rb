class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.friends_count = 3
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end

end
