class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Authentication
  include AccountProfiles
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def not_found_method
    render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
  end

  private

  def user_not_authorized(exception)
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end
end
