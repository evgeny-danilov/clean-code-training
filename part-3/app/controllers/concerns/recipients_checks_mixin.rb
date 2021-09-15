# frozen_string_literal: true

module RecipientsChecksMixin
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  def valid_recipients?
    invalid_recipients.empty?
  end

  def valid_comment?
    comment.present?
  end

  def invalid_recipients
    recipient_list.map do |item|
      item unless item.match(EMAIL_REGEX)
    end.compact
  end
  helper_method :invalid_recipients
end
