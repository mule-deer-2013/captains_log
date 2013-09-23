class ApplicationController < ActionController::Base
  protect_from_forgery
  include Authentication

  helper_method :current_user, :signed_in?

  # REVIEW: where does this come from?
  def handle_unverified_request
  	sign_out
  	super
  end
end
