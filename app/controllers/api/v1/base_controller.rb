class Api::V1::BaseController < ApplicationController

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
		include Devise::Controllers::Helpers
		protect_from_forgery with: :exception, if: :json_request?
		protect_from_forgery with: :null_session, if: :json_request?
  respond_to :json
		skip_before_action :authenticate_user!, :raise => false

  include Authenticable

		protected

		def json_request?
				request.format.json?
		end

end