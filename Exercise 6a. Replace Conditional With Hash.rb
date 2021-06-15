# frozen_string_literal: true

def prepare_for_conference(user_type)
  case user_type
    when :attendee
      :register
    when :speaker
      :wake_up
    when :matz
      :make_tea
  end
end
