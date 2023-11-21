class ApplicationController < ActionController::Base
  rescue_from Exception, with: :handle_exception

  private

  def handle_exception(exception)
    logger.error("Unhandled exception: #{exception.message}")
    flash[:alert] = "An unexpected error occurred. Please try again later."
    redirect_to root_path
  end
end

