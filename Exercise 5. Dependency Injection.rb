# frozen_string_literal: true

class UserNotifier
  def call(user, message:, sender: EmailSender)
    sender.send(user.email, message)
  end
end

notifier = UserNotifier.new
notifier.call(user, message: "Hello World", sender: SmsSender)
