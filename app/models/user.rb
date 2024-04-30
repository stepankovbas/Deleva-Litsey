class User < ApplicationRecord

    has_one_attached :photo

    has_secure_password
    
    # Валідація на присутність
    validates :first_name, :last_name, :patronymic, :user_name, :email, :password_digest, :role,  presence: true

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

    def birth_date_must_be_in_the_past
        if birth_date.present? && birth_date > Date.today
        errors.add(:birth_date, "must be in the past")
        end
    end
end
