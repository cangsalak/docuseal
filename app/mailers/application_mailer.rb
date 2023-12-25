# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'Cangsalak <cangsalak@gmail.com>'
  layout 'mailer'

  register_interceptor ActionMailerConfigsInterceptor

  before_action do
    ActiveStorage::Current.url_options = Docuseal.default_url_options
  end

  def default_url_options
    Docuseal.default_url_options
  end
end
