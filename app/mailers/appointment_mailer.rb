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
end
