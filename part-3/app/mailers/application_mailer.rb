# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'test@mail.com'
  layout 'mailer'
end