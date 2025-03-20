class User < ActiveRecord::Base
    validates :name, presence: true, length: { maximum: 50 }

    before_save { self.email = email.downcase }
    validates :email, presence: true, uniqueness: {case_sensitive: false}

    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password
end
