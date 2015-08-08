module MainHelper
	def activeSubbMenu?(route)
		params[:action] == route
	end
end
