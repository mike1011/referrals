class Users::InvitationsController < Devise::InvitationsController
  private

    # This is called when creating invitation.
    # It should return an instance of resource class.
    def invite_resource
      # skip sending emails on invite
      super { |user| user.skip_invitation = false }
    end

    # This is called when accepting invitation.
    # It should return an instance of resource class.
    def accept_resource
      resource = resource_class.accept_invitation!(update_resource_params)
      # Report accepting invitation to analytics
      # Analytics.report('invite.accept', resource.id)
      resource
    end
end