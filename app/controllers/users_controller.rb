class UsersController < ApplicationController

    before_action :require_no_authentication, only: %i[sign_up create]
    before_action :require_authentication, only: %i[edit update]
    before_action :set_user!, only: %i[edit update]

    def sign_up
        @user = User.new     
    end

    def create
        @user = User.new(user_params) 
        @user.role = session[:user_type]
        if @user.save
            #flash[:success] = "Вітаю ви успішно зареєструвались!"
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render "sign_up"
        end  

    end


    def edit
    end

    def update
      if @user.update edit_user_params
        redirect_to edit_user_path(@user)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def show
        @user = User.find(params[:id])
        redirect_to(root_path, alert: "Ви не маєте доступу до цієї сторінки.") unless current_user == @user
    end      


    private

    def set_user!
        @user = User.find params[:id]
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :patronymic, :user_name, :email, :password, :password_confirmation)
    end

    def edit_user_params
        params.require(:user).permit(
            :first_name, 
            :last_name, 
            :patronymic, 
            :birth_date, 
            :phone_number, 
            :sex, 
            :user_name, 
            :email, 
            :password,
            :password_confirmation, 
            :old_password,
            :photo, 
            :class_name
        )
    end

end
