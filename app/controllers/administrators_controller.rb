class AdministratorsController < ApplicationController

    before_action :require_admin, only: :destroy

    def index
        @administrators = User.where(role: :admin)
    end
    
    def show
        @administrator = User.find(params[:id])
    end
       
    def destroy
        @administrator = User.find(params[:id])
        @administrator.destroy
        redirect_to administrators_url
    end

    private
    def require_admin
        redirect_to root_path, alert: 'Доступ заборонено.' unless current_user.admin?
    end
    
end
