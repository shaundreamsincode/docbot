class SummaryMailer < ApplicationMailer
  def summary_email(doctor_email:, name:, date_of_birth:, patient_email:, summary_content:)
    @doctor_email = doctor_email
    @name = name
    @date_of_birth = date_of_birth
    @patient_email = patient_email
    @summary_content = summary_content

    mail(
      to: @doctor_email,
      subject: 'Summary generated from DocBot',
      from: 'docbot@docbot.tech',
      message_stream: 'broadcast'
    )
  end
end
