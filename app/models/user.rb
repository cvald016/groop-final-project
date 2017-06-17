class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"

  has_and_belongs_to_many :friends,
                          class_name: "User",
                          join_table: :friendships,
                          foreign_key: :user_id,
                          association_foreign_key: :friend_user_id

  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     # user.email
  #     # user.picture_url 
  #     user.oauth_token = auth.credentials.token
  #     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.save!
  #   end
  # end       


  # Initializes or updates user object when logging in with Facebook
  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.name ||= auth.info.name
      user.email ||= auth.info.email
      user.picture_url ||= "http://graph.facebook.com/#{auth.uid}/picture?width=500"
      user.save!
    end
  end                   

end
