class User < ActiveRecord::Base
    has_secure_password
    has_many :jobs
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :password, length: { in: 8..40 }
end
