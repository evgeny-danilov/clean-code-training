# frozen_string_literal: true

module InvitationService
  class Sender
    include Dry::Monads[:result]

    def initialize(params:, current_user:, report:)
      @params = params
      @report = report
      @current_user = current_user
    end

    def call
      form.validate!.bind do
        Success(batch_send_invitations.tap { after_commit_callback })
      end
    end

    private

    attr_reader :params, :current_user, :report

    def batch_send_invitations
      form.recipients.each do |email|
        next if Invitation.exists?(report: report, recipient_email: email)

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

    def after_commit_callback
      report.activate!
    end

    def form
      @form ||= Form.new(params)
    end
  end
end
