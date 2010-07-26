ActionController::RequestForgeryProtection.module_eval do
  def form_authenticity_token
    session[:_csrf_token] ||= ActiveSupport::SecureRandom.base64(32)

    page_will_be_cached? ? "" : session[:_csrf_token]
  end
end