# frozen_string_literal: true

ACTIONS_BY_USER_TYPE = {
  attendee: :register,
  speaker:  :wake_up,
  matz:     :make_tea  
}

def prepare_for_conference(user_type)
  ACTIONS_BY_USER_TYPE[user_type]
end

# They could be classes (strategies) as well:
# 
# ACTIONS_BY_USER_TYPE = {
#   attendee: AttendeeStrategy,
#   speaker:  SpeakerStrategy,
#   matz:     MatzStrategy
# }
# ACTIONS_BY_USER_TYPE[user_type].new(Time.now).call
# 
# ...or even lambdas
# 
# ACTIONS_BY_USER_TYPE = {
#   attendee: ->(time) { :register if ten_minutes_left?(time) },
#   speaker:  ->(time) { :wake_up if one_hour_left?(time) },
#   matz:     ->(_) { :make_tea }
# }
# ACTIONS_BY_USER_TYPE[user_type].call(Time.now)
