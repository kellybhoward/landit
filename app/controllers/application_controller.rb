class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    def require_login
        redirect_to '/welcome' if session[:id] == nil
    end
    def current_user
        User.find(session[:id]) if session[:id]
    end
    helper_method :current_user
    protect_from_forgery with: :exception
end
