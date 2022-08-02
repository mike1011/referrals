class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token, if: :json_request?
	protect_from_forgery with: :null_session, only: :json_request?
	protected

	def json_request?
			request.format.json?
	end

end
