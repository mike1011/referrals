module ApplicationHelper

	##not used - quite volatile and behaves intermittent while loading files..even breaks..maybe race condition...TODO
	def load_js_pack
		## array of all files in packs folder
		Rails.logger.info "========= Load pack dynamically ====== #{controller_name}"
		bundle_file_names = Dir.glob("#{Rails.root}/client/packs/*").map{ |s| File.basename(s) }
		if bundle_file_names.include?("#{controller_name}-bundle.js")
			"#{controller_name}-bundle"
		else
			"placeholder-bundle"
		end
	end

end
