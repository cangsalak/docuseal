# frozen_string_literal: true

class SettingsMailer < ApplicationMailer
  def smtp_successful_setup(email)
    mail(to: email, subject: 'กำหนดค่า SMTP เรียบร้อยแล้ว')
  end
end
