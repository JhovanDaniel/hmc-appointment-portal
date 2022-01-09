class AppointmentsController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:new, :create, :confirmation]
  
  def new
      @appointment = Appointment.new
  end
  
  def create
        
      @appointment = Appointment.new(appointment_params)
      if @appointment.save
          name = @appointment.first_name
          appointment_time = @appointment.appointment_time.strftime("%d-%m-%Y at %H:%M").to_s
          location = @appointment.location.name
          flash[:notice] = "Thank you, " + name + "! Your appointment was created successfully for " + appointment_time + ", at " + location + "."
          redirect_to root_path
      else
         render 'new' 
      end
  end 
  
  def index
    @article = Appointment.all
  end
    
    
    private
    
    def appointment_params
       params.require(:appointment).permit(:first_name, :last_name, :date_of_birth, :gender, :phone, :email, :appointment_time, :location_id) 
    end

end
