module ConfigHelper

	def render_app_data_script
		content_tag :script do
				concat "const APP_CONFIG = #{config_hash}".html_safe
		end
	end

	def config_hash
		{
			user: current_user_attrs,
			env: {
					railsEnv: Rails.env,
			},
		}.to_json
	end

def current_user_attrs
	return {} unless current_user
		{
				id: current_user.id,
				email: current_user.email,
				sign_in_link: new_user_session_path,
				sign_out_link: destroy_user_session_path
		}
end

end