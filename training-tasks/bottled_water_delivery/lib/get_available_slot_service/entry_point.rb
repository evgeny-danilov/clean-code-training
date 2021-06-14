# frozen_string_literal: true

module GetAvailableSlotService
  class EntryPoint
    def initialize
      raise NotImplementedError
    end

    def call
      raise NotImplementedError
    end
  end
end
