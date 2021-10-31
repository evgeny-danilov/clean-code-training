# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.boolean :active

      t.timestamps
    end
  end
end
