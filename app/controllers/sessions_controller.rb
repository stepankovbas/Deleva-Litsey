class SessionsController < ApplicationController

    before_action :require_no_authentication, only: %i[new create]
    before_action :require_authentication, only: :destroy

    def new
    end

    def create
        user = User.find_by email: params[:email]
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:warning] = "Неправельний логін чи пароль"
            redirect_to new_session_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
    
end
