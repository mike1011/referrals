class UserSerializer < ApplicationSerializer
  attributes :id, :email
  has_many :invitations, serializer: InvitationSerializer
end
