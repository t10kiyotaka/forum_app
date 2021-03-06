class User < ApplicationRecord
  has_many :discussions

  def self.create_or_update_from(auth_info)
    user = where(uid: auth_info[:uid], provider: auth_info[:provider]).first_or_create
    user.update(
      nickname:       auth_info[:info][:nickname],
      name:           auth_info[:info][:name],
      email:          auth_info[:info][:email],
      location:       auth_info[:info][:location],
      image_url:      auth_info[:info][:image],
      description:    auth_info[:info][:description],
      token:          auth_info[:credentials][:token],
      secret:         auth_info[:credentials][:secret],
    )
    user
  end

  def owns_discussion?(discussion)
    id == discussion.user_id
  end

end
