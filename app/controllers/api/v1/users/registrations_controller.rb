class Api::V1::Users::RegistrationsController < Api::V1::BaseController

  before_action :authenticate_with_token!, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    if params[:user][:email].nil?
      render :status => 400,
             :json => {:message => 'User request must contain the user email.'}
      return
    elsif params[:user][:password].nil?
      render :status => 400,
             :json => {:message => 'User request must contain the user password.'}
      return
    end

    if params[:user][:email]
      duplicate_user = User.find_by_email(params[:user][:email])
      unless duplicate_user.nil?
        render :status => 409,
               :json => {:message => 'Duplicate email. A user already exists with that email address.'}
        return
      end
    end

    @user = User.create(sign_up_params)

    if @user.save
      render(status: 200, json: UserSerializer.new(@user, root:false).to_json)
    else
      render :status => 400,
             :json => {:message => @user.errors.full_messages}
    end
  end



  private

    def sign_up_params
      params.require(:user).permit(:email, :password)
    end

end