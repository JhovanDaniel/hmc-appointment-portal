class AppointmentTestsController < ApplicationController
    
    before_action :set_appointment_test, only: [:show, :edit, :update, :destroy]
    
    def new
        @appointment_test = AppointmentTest.new(appointment_test_params)
        if @appointment_test.save
            flash[:notice] = "Test was successfully created for appointment HMCAP" + @appointment_test.appointment_id.to_s
        else
            flash[:alert] = "There was a problem creating the test"
        end
    end
    
    def create
      
    end 
    
    def index
        @appointment_tests = AppointmentTest.all
    end
    
    private
    
    def appointment_test_params
       params.permit(:appointment_id, :laboratory_number) 
    end
    
    def set_appointment_test
      @appointment_test = AppointmentTest.find(params[:id])
    end
    
end
