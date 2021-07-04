# frozen_string_literal: true

class UserNotifier
  def call(user, message, type)
    if type == 'email'
      EmailSender.send(user.email, message)
    elsif type == 'sms'
      SmsSender.send(user.email, message)
    end
  end
end

notifier = UserNotifier.new
notifier.call(user, "Hello World", 'email')
