class Location < ApplicationRecord
    
    has_many :appointments
    has_many :users
    
end