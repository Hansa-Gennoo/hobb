class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_admin!
    unless current_user && current_user.admin?
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
