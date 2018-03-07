class Users::RegistrationsController < Devise::RegistrationsController
  before_action :set_avatar_id, only: :create

  def new
    super do |resource|
      @avatar_id = session['devise.avatar_id']
      resource.build_avatar
    end
  end

  def create
    super do |resource|
      if resource.persisted?
        if params[:user][:avatar_attributes]
          resource.avatar = Avatar.new(image: params[:user][:avatar_attributes][:image])
        elsif @avatar_id.present?
          resource.avatar = Avatar.find(@avatar_id)
        end
        resource.avatar.save if resource.avatar.present?
      end
    end
  end

  def update
    super do |resource|
      if params[:user][:avatar_attributes]
        resource.avatar.update(image: params[:user][:avatar_attributes][:image])
      end
    end
  end

  private

  def set_avatar_id
    @avatar_id = params[:avatar_id]
  end
end
