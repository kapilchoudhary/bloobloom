class User < ApplicationRecord
    has_secure_password
    
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :username, presence: true, uniqueness: true
    validates :password,
              length: { minimum: 8 },
              if: -> { new_record? || !password.nil? }
    enum currency: {
        USD: 0,
        GBP: 1,
        EUR: 2,
        JOD: 3,
        JPY: 4,
    }
end
