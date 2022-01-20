class AppointmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.appointment_created.subject
  #
  def appointment_created
    @appointment = params[:appointment]
    @greeting = "Hi"
    attachments['HMC-logo.png'] = File.read('app/assets/images/HMC-logo.png')

    mail(
      from: 'HMC Appointment Booking <hmc.testmailer@gmail.com>',
      to: email_address_with_name(@appointment.email, @appointment.first_name),
      bcc: 'hmc.testmailer@gmail.com', 
      subject: 'HMC Appointment Confirmation HMCAP'+@appointment.id.to_s
      )
  end
  
  def test_approved
    @appointment_test = params[:appointment_test]


     rendered_receipt = ApplicationController.render(
      :template      => 'appointment_tests/show_certificate.html.erb',
      :layout        => 'pdf.html', 
      :page_size     => 'Letter',
      :locals        => { appointment_test: @appointment_test }
    )
    
    
    attachments["Results_HMCAP#{@appointment_test.appointment_id}.pdf"] = WickedPdf.new.pdf_from_string(rendered_receipt)
    attachments['HMC-logo.png'] = File.read('app/assets/images/HMC-logo.png')
    
    #attachments['HMC-logo.png'] = File.read('app/assets/images/HMC-logo.png')
    
    #attachments["test_#{@appointment_test.id}.pdf"] = WickedPdf.new.pdf_from_string(
    #  render_to_string(pdf: "file_name", template: "appointment_tests/show_certificate.html.erb", 
    #  page_size: 'Letter', layout: 'pdf.html'), :hash_with_wickedpdf_options
    #)
    

    mail(
      from: 'HMC Appointment Booking <hmc.testmailer@gmail.com>',
      to: email_address_with_name(@appointment_test.appointment.email, @appointment_test.appointment.first_name),
      bcc: 'hmc.testmailer@gmail.com', 
      subject: 'Test Results HMCAP'+@appointment_test.appointment.id.to_s
      )
  end
end
