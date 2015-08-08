module AdminHelper
	def activeSubMenu?(route)
		params[:action] == route
	end
end
