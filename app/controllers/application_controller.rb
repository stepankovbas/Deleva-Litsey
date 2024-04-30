class ApplicationController < ActionController::Base

    
    private
    
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?    
    end

    def user_signed_in?
        current_user.present?    
    end

    def require_authentication
      return if user_signed_in?

      flash[:warning] = t 'global.flash.not_signed_in'
      redirect_to root_path
    end

    def require_no_authentication
      return unless user_signed_in?

      flash[:warning] = t 'global.flash.already_signed_in'
      redirect_to root_path
    end



    helper_method :current_user, :user_signed_in? 

end
