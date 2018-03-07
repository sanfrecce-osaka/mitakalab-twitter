class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    %i(sign_up account_update).each { |action| devise_parameter_sanitizer.permit(action, keys: [:name, :username, :location, :about, :avatar_id]) }
  end
end
