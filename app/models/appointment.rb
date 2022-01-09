class Appointment < ApplicationRecord
    
    belongs_to :location
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105}, 
    format: { with: VALID_EMAIL_REGEX }
        
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :date_of_birth, presence: true
    validates :gender, presence: true
    validates :phone, presence: true, length: { is: 10 }
end