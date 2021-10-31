# frozen_string_literal: true

class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.references :report
      t.references :sender, polymorphic: true
      t.string :recipient_email
      t.string :status

      t.timestamps

      t.index %i[report_id recipient_email], unique: true
    end
  end
end
