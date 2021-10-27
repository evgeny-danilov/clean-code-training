# frozen_string_literal: true

module InvitationService
  class Sender
    def initialize(form:, current_user:, report:)
      @form = form
      @report = report
      @current_user = current_user
    end

    def call
      form.validate!
      
      batch_send_invitations
    end

    private

    attr_reader :form, :current_user, :report

    def batch_send_invitations
      form.recipients.each do |email|
        invitation = create_invitation(email)
        notify_recipient(invitation)
      end
    end

    def create_invitation(email)
      Invitation.create(
        report: report,
        sender: current_user,
        recipient_email: email,
        status: 'pending'
      )
    end

    def notify_recipient(invitation)
      Mailer.invitation_notification(invitation.id, form.comment).deliver_later
    end
  end
end
