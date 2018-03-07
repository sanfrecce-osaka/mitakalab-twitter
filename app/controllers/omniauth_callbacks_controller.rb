class OmniauthCallbacksController < ApplicationController
  def twitter
    user, avatar = User.from_omniauth(request.env['omniauth.auth'])

    if user.persisted?
      flash.notice = 'ログインしました'
      sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.attributes
      session['devise.avatar_id'] = avatar.id
      redirect_to new_user_registration_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    signed_in_root_path(resource_or_scope)
  end
end
