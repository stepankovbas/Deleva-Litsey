class TeachersRoomController < ApplicationController

    before_action :require_admin, only: [:edit, :update, :destroy]
    before_action :set_teacher, only: [:show, :edit, :update, :destroy]

    def index
        @teachers = User.where(position: 'Вчитель')
    end
    
    def show
    end

    def edit
    end

    def update
        if @teacher.update(teacher_params)
            redirect_to @teacher, notice: 'Вчителя успішно оновлено.'
        else
            render :edit
        end
    end
       
    def destroy
        @teacher.destroy
        redirect_to teachers_url, notice: 'Вчителя успішно видалено.'
    end

    private

    def require_admin
        redirect_to root_path, alert: 'Доступ заборонено.' unless current_user.admin?
    end

    def set_teacher
        @teacher = User.find(params[:id])
    end

    def teacher_params
        params.require(:user).permit(:first_name, :last_name, :patronymic, :birth_date, :phone_number, :sex, :user_name, :email, :password, :photo, :position, :class_name, :role)
    end

end
