class ApplicationController < ActionController::Base
  NotAuthorized = Class.new(StandardError)
  protect_from_forgery with: :exception

  rescue_from ApplicationController::NotAuthorized do |exception|
    render_error_page(status: 403, text: 'Forbidden')
  end

  def user_can_view(object)
    if object.has_attribute? "user_id"
      if object.user_id == current_user.id
        return true
      else
        return false
      end
    end
  end

  private

  def render_error_page(status:, text:, template: 'errors/routing')
    respond_to do |format|
      format.json { render json: {errors: [message: "#{status} #{text}"]}, status: status }
      format.html { head :forbidden }
      format.any  { head status }
    end
  end
end
