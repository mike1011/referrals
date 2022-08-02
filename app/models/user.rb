class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable,
         :invitable,
         :jwt_authenticatable, :jwt_revocation_strategy => JwtDenylist


  ## easy way to access invitations
  has_many :invitations, :class_name => 'User', :foreign_key => 'invited_by', dependent: :destroy

  ## ====== callbacks =======
  after_invitation_accepted :post_acceptance_handler

  validates_presence_of :email

  ## ===== Instance methods =========
  def invitation_accepted?
    invitation_accepted_at.present?
  end

  def post_acceptance_handler
    ## any logic that needs to be executed once the invitation is accepted via email comes here...
    Rails.logger.debug "###############  INVITATION EMAIL ACCEPTED CALLBACK ###################"
  end
end
