class InvitationCodesController < ApplicationController
  before_action :authenticate_admin_or_teacher, only: [:generate, :create]

  def generate
    @invitation_code = InvitationCode.new
  end    

  def create
    @invitation_code = InvitationCode.new(invitation_code_params)
    @invitation_code.code = SecureRandom.hex(4)  # Генерувати код
    @invitation_code.expires_at = Time.now + 24.hours
    @invitation_code.active = true

    if @invitation_code.save
      render "generate"
    else
      redirect_to root_path
    end
  end

  def registration
  end

  def check_code        
    entered_code = params[:invitation_code]
    invitation_code = InvitationCode.find_by(code: entered_code)

    if invitation_code && invitation_code.active? && invitation_code.expires_at > Time.now
      session[:user_type] = invitation_code.user_type
      redirect_to sign_up_url
    else
      redirect_to root_path
    end   
  end

  private

  def invitation_code_params
    params.require(:invitation_code).permit(:user_type)
  end

  def authenticate_admin_or_teacher
    unless current_user && (current_user.admin? || current_user.teacher?)
      redirect_to root_path, alert: "У вас немає доступу до цієї сторінки."
    end
  end
end
