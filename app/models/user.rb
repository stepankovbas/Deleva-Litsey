class User < ApplicationRecord

    has_one_attached :photo

    attr_accessor :old_password

    has_secure_password
    
    # Валідація на присутність
    validates :first_name, :last_name, :patronymic, :user_name, :email, :password_digest, :role,  presence: true

    validate :correct_old_password, on: :update, if: -> { password.present?}

    # Валідація унікальності
    validates :email, :user_name, uniqueness: true

    # Валідація формату електронної пошти
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

    # Валідація формату номера телефону (припустимо, що ви хочете використовувати простий формат)
    validates :phone_number, format: { with: /\A\+\d{10,15}\z/ },
                                allow_blank: true

    # Валідація, що фото може бути не обов'язковим
    validates :photo, presence: false

    # Валідація дати народження (переконайтеся, що дата народження в минулому)
    validate :birth_date_must_be_in_the_past

    private

    def correct_old_password
        return if BCrypt::Password.new(password_digest_was).is_password?(old_password)
    
        errors.add :old_password, 'is incorrect'
    end

    def birth_date_must_be_in_the_past
        if birth_date.present? && birth_date > Date.today
        errors.add(:birth_date, "must be in the past")
        end
    end
end
