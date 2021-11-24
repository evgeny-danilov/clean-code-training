# frozen_string_literal: true

class RemoveReportIdIndexFromInvitation < ActiveRecord::Migration[6.1]
  def change
    remove_index :invitations, ['report_id'], name: 'index_invitations_on_report_id'
  end
end
