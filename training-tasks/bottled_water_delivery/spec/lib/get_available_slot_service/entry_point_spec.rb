# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GetAvailableSlotService::EntryPoint do
  subject { described_class.new.call }
end
