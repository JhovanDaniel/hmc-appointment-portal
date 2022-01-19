class AppointmentsController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [:new, :create, :confirmation]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  
  
  def new
      @appointment = Appointment.new
  end
  
  def create
        
      @appointment = Appointment.new(appointment_params)
      if @appointment.save
        AppointmentMailer.with(appointment: @appointment).appointment_created.deliver_later
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
    @appointments = Appointment.all
  end
  
  def show
    
  end
  
  def edit 
    
  end
  
  def update
      if @appointment.update(appointment_params)
          flash[:notice] = "Appointment was updated successfully"
          redirect_to @appointment
      else
          render 'edit'
      end
  end
  
  def destroy 
    @appointment.destroy
    flash[:notice] = "Appointment was deleted successfully"
    redirect_to appointments_path
  end
    
    
    private
    
    def appointment_params
       params.require(:appointment).permit(:first_name, :last_name, :date_of_birth, :gender, :phone, :email, :appointment_time, :location_id) 
    end
    
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

end
