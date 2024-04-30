class InvitationCodesController < ApplicationController
    
    def generate
        @invitation_code = InvitationCode.new
    end    

    def create
        @invitation_code = InvitationCode.new(invitation_code_params)
        @invitation_code.code = SecureRandom.hex(4)  # Генерувати код
        @invitation_code.expires_at = Time.now + 24.hours
        @invitation_code.active = true
    
        if @invitation_code.save
            # flash[:notice] = "Код запрошення створено: #{@invitation_code}"
            render "generate"
        else
            # flash[:alert] = "Не вдалося створити код запрошення: " + @invitation_code.errors.full_messages.join(", ")
            redirect_to root_path
        end
    end

    def registration
        
    end

    def check_code        

        # Отримання коду з параметрів форми
        entered_code = params[:invitation_code]
    
        # Пошук запрошувального коду в базі даних
        invitation_code = InvitationCode.find_by(code: entered_code)
    
        # Перевірка, чи код існує та чи він активний
        if invitation_code && invitation_code.active? && invitation_code.expires_at > Time.now
            # Код дійсний, перенаправлення на сторінку реєстрації
            session[:user_type] = invitation_code.user_type  # Зберігаємо user_type в сесії
            redirect_to sign_up_url#, notice: "Код запрошення прийнято. Будь ласка, зареєструйтеся."
        else
            # Код не дійсний або не знайдений, повернення на форму з повідомленням про помилку
            redirect_to root_path#, alert: "Невірний або застарілий код запрошення."
        end   
        
    end
    

    private

    def invitation_code_params
        params.require(:invitation_code).permit(:user_type)
    end
end
