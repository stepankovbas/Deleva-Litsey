class AdministratorsController < ApplicationController

    before_action :require_admin, only: [:edit, :update, :destroy]
    before_action :set_administrator, only: [:show, :edit, :update, :destroy]

    def index
        @administrators = User.where(role: :admin)
    end
    
    def show
    end

    def edit
    end

    def update
        if @administrator.update(administrator_params)
            redirect_to @administrator, notice: 'Адміністратора успішно оновлено.'
        else
            render :edit
        end
    end
       
    def destroy
        @administrator.destroy
        redirect_to administrators_url, notice: 'Адміністратора успішно видалено.'
    end

    private

    def require_admin
        redirect_to root_path, alert: 'Доступ заборонено.' unless current_user.admin?
    end

    def set_administrator
        @administrator = User.find(params[:id])
    end

    def administrator_params
        params.require(:user).permit(:first_name, :last_name, :patronymic, :birth_date, :phone_number, :sex, :user_name, :email, :password, :photo, :position, :class_name, :role)
    end

end
