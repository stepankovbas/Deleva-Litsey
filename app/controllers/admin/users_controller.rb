# app/controllers/admin/users_controller.rb
class Admin::UsersController < ApplicationController

    before_action :require_admin
    #before_action :require_authentication
  
    def index
      @users = User.all
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "Користувач успішно оновлений."
      else
        render :edit
      end
    end
  
    private
  
    def user_params
        params.require(:user).permit(:first_name, :last_name, :patronymic, :birth_date, :phone_number, :sex, :user_name, :email, :password, :password_confirmation, :photo, :position, :role, :class_name)
    end      
  
    def require_admin
      redirect_to root_path, alert: "Доступ заборонено." unless current_user.try(:admin?)
    end

  end
  