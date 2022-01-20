class AppointmentTestsController < ApplicationController
    
    before_action :set_appointment_test, only: [:show, :edit, :update, :destroy, :show_certificate, :approve_result]
    
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
    
    def edit 
    
    end
    
    def update
        if @appointment_test.update(appointment_test_update_params)
            flash[:notice] = "Test was updated successfully"
            redirect_to @appointment_test
        else
            render 'edit'
        end
    end
     
    def show
    
    end
    
    def destroy 
        @appointment_test.destroy
        flash[:notice] = "Test was deleted successfully"
        redirect_to appointment_tests_path
    end
    
    def show_certificate
        respond_to do |format|
            format.html
            format.pdf do
                render pdf: "file_name", template: "appointment_tests/show_certificate.html.erb", page_size: 'Letter', layout: 'pdf.html', :locals => { appointment_test: @appointment_test }
            end
        end
    end
    
    def approve_result
        if @appointment_test.approval_status == true
            @appointment_test.approval_status = false
            if @appointment_test.save
                flash[:notice] = "Test was approved successfully"
                redirect_to appointment_tests_path
            else
                flash[:notice] = "Test was not saved due to an error"
                redirect_to appointment_tests_path
            end
            
        else
            @appointment_test.approval_status = true
            if @appointment_test.save
                AppointmentMailer.with(appointment_test: @appointment_test).test_approved.deliver_later
                flash[:notice] = "Test was approved successfully"
                redirect_to appointment_tests_path
            else
                flash[:notice] = "Test was not saved due to an error"
                redirect_to appointment_tests_path
            end
        end
    end
    
    
    private
    
    def appointment_test_params
       params.permit(:appointment_id, :laboratory_number, :speciment_number, :control_number, :result_date, :result, :reception_date) 
    end
    
    def appointment_test_update_params
       params.require(:appointment_test).permit(:appointment_id, :laboratory_number, :speciment_number, :control_number, :result_date, :result, :approval_status, :reception_date) 
    end
    
    def set_appointment_test
      @appointment_test = AppointmentTest.find(params[:id])
    end
    
end
