class User < ApplicationRecord
  has_one :avatar
  accepts_nested_attributes_for :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:twitter]

  class << self
    def from_omniauth(auth)
      returns = []
      returns << where(provider: auth[:provider], uid: auth[:uid]).first_or_initialize do |user|
        user.name = auth.info.name
        user.username = auth.info.nickname
        user.email = auth.info.email
        user.location = auth.info.location
        user.about = auth.info.description
      end
      returns << Avatar.create(image: URI.parse(auth.info.image))
    end

    def new_with_session(params, session)
      if session['devise.user_attributes']
        new(session['devise.user_attributes']) do |user|
          user.attributes = params
        end
      else
        super
      end
    end
  end

  def to_param
    username
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
