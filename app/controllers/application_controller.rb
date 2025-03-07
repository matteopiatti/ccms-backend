class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :null_session

  rescue_from ActionController::ParameterMissing, with: :handle_unknown_attribute_error

  private

  def handle_unknown_attribute_error(exception)
    Rails.logger.error(exception)
    render json: { error: "Invalid field." }, status: :unprocessable_entity
  end
end
