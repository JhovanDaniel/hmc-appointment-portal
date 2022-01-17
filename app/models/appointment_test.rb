class AppointmentTest < ApplicationRecord
    belongs_to :appointment
    
    validates :appointment_id, uniqueness: true
    
    
end