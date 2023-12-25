# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def invitation_email(user, invited_by: nil)
    @current_account = invited_by&.account || user.account
    @user = user
    @token = @user.send(:set_reset_password_token)

    mail(to: @user.friendly_name,
         subject: 'คุณได้รับเชิญให้เข้าร่วม Esign Approve')
  end
end
