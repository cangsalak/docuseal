# frozen_string_literal: true

# == Schema Information
#
# Table name: account_configs
#
#  id         :bigint           not null, primary key
#  key        :string           not null
#  value      :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#
# Indexes
#
#  index_account_configs_on_account_id          (account_id)
#  index_account_configs_on_account_id_and_key  (account_id,key) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class AccountConfig < ApplicationRecord
  SUBMITTER_INVITATION_EMAIL_KEY = 'submitter_invitation_email'
  SUBMITTER_COMPLETED_EMAIL_KEY = 'submitter_completed_email'
  SUBMITTER_DOCUMENTS_COPY_EMAIL_KEY = 'submitter_documents_copy_email'
  BCC_EMAILS = 'bcc_emails'
  FORCE_MFA = 'force_mfa'
  ALLOW_TYPED_SIGNATURE = 'allow_typed_signature'
  SUBMITTER_REMAILERS = 'submitter_reminders'
  FORM_COMPLETED_BUTTON_KEY = 'form_completed_button'

  DEFAULT_VALUES = {
    SUBMITTER_INVITATION_EMAIL_KEY => {
      'subject' => 'คุณได้รับเชิญให้ส่งแบบฟอร์ม',
      'body' => "Esign Approve,\n\n" \
                "คุณได้รับเชิญให้ส่ง \"{{template.name}}\" จาก.\n\n" \
                "{{submitter.link}}\n\n" \
                "โปรดติดต่อเราโดยตอบกลับอีเมลนี้หากคุณไม่ได้ร้องขอ\n\n" \
                "ขอบคุณค่ะ,\n" \
                '{{account.name}}'
    },
    SUBMITTER_COMPLETED_EMAIL_KEY => {
      'subject' => '{{template.name}} เสร็จสมบูรณ์โดย{{submission.submitters}}',
      'body' => "Hi,\n\n" \
                "\"{{template.name}}\" เสร็จสมบูรณ์โดย{{submission.submitters}}\n\n" \
                '{{submission.link}}'
    },
    SUBMITTER_DOCUMENTS_COPY_EMAIL_KEY => {
      'subject' => 'สำเนาเอกสารของคุณ',
      'body' => "Esign Approve,\n\n" \
                "กรุณาตรวจสอบสำเนาของคุณ \"{{template.name}}\" ส่งในไฟล์แนบอีเมล\n" \
                "หรือคุณสามารถดาวน์โหลดสำเนาของคุณโดยใช้:\n\n" \
                "{{documents.link}}\n\n" \
                "ขอบคุณค่ะ,\n" \
                '{{account.name}}'
    }
  }.freeze

  belongs_to :account

  serialize :value, JSON
end
