# app/models/user.rb

class User < ApplicationRecord
    has_secure_password
  
    # Basic information
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :first_name, presence: true
    validates :last_name, presence: true
  
    # Authentication
    validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }
  
    # Address information
    validates :street_address, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true
  
    # Associations
    has_many :orders
    has_one :cart
  
    # Methods
    def full_name
      "#{first_name} #{last_name}"
    end
  end
  