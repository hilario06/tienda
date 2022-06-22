class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    # redirect_to(request.referrer || root_path)
    redirect_to root_path
  end
end
