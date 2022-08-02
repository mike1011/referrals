class InvitationSerializer < ApplicationSerializer
  attributes :email, :accepted, :sent_at, :new_invitation_url

  def accepted
    object.invitation_accepted?
  end

  def sent_at
    object&.invitation_sent_at&.strftime('%a %d %b %y')
  end

  def new_invitation_url
      Rails.application.routes.url_helpers.new_user_invitation_path
  end
end
