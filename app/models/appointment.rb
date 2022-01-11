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
    
    def is_today?
        if self.appointment_time.strftime("%d-%m-%Y") == Date.today.strftime("%d-%m-%Y")
            return true
        else
            return false
        end
    end
    
    def is_before_today?
        if self.appointment_time.strftime("%d-%m-%Y") < Date.today.strftime("%d-%m-%Y")
            return true
        else
            return false
        end
    end
    
    def is_after_today?
        if self.appointment_time.strftime("%d-%m-%Y") > Date.today.strftime("%d-%m-%Y")
            return true
        else
            return false
        end
    end
    
    def self.is_today_count
        count = 0
        appointments = Appointment.all
        appointments.each do |appointment|
            if appointment.is_today?
                count = count + 1
            else 
                count = count
            end
        end
        return count
    end
    
    def self.is_after_today_count
        count = 0
        appointments = Appointment.all
        appointments.each do |appointment|
            if appointment.is_after_today?
                count = count + 1
            else 
                count = count
            end
        end
        return count
    end
    
    def self.is_today_count
        count = 0
        appointments = Appointment.all
        appointments.each do |appointment|
            if appointment.is_today?
                count = count + 1
            else 
                count = count
            end
        end
        return count
    end
    
    def self.is_in_clinic_count
        count = 0
        appointments = Appointment.all
        appointments.each do |appointment|
            if (appointment.is_today? and appointment.location.name == "Hughes Medical Center")
                count = count + 1
            else 
                count = count
            end
        end
        return count
    end
    
    def self.is_not_in_clinic_count
        count = 0
        appointments = Appointment.all
        appointments.each do |appointment|
            if (appointment.is_today? and appointment.location.name != "Hughes Medical Center")
                count = count + 1
            else 
                count = count
            end
        end
        return count
    end
        
end