class Api::V1::Users::SessionsController < Api::V1::BaseController

  before_action :authenticate_with_token!, except: [:create]
  skip_before_action :verify_authenticity_token
  before_action :ensure_params_exist

  respond_to :json

  def create
    resource = User.find_for_database_authentication(
      email: params[:user][:email]
    )
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in(:user, resource)
      render(status: 200, success: true, json: UserSerializer.new(resource, root:false).to_json)
      return
    end
    invalid_login_attempt
  end

  def destroy
    resource = current_user
    resource.authentication_token = nil
    resource.save
    head 204
  end


  protected
    def ensure_params_exist
      return unless params[:user].blank?
      render json: {
        success: false,
        message: "missing user parameter"
      }, status: 422
    end

    def invalid_login_attempt
      warden.custom_failure!
      render json: {
        success: false,
        message: "Error with your email or password"
      }, status: 401
    end

end