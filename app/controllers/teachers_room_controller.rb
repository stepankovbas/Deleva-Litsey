class TeachersRoomController < ApplicationController

    def index
        @teachers = User.where(role: :teacher, position: 'Вчитель')
    end
  
    def show
        @teacher = User.find(params[:id])
    end

end
