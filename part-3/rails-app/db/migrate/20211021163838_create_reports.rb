# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports, &:timestamps
  end
end
