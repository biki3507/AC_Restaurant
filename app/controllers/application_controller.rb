# dsfds
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticate_admin
    return unless current_user.admin?
    flash[:alert] = '不允許進入'
    redirect_to root_path
  end
end
