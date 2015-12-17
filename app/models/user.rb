class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    has_secure_password
    has_many :shoes
    has_many :purchases, class_name: "Shoe", foreign_key: "buyer_id"
    
    validates :name, :email, :password, :password_confirmation, presence: true
    validates_length_of :name, minimum: 2
    validates_length_of :password, minimum: 8, maximum: 20
    validates :password, confirmation: true
    validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
    
    before_save do
        self.email.downcase!
    end
end