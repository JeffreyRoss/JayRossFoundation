module UsersHelper
	def activeSubMenu?(route)
		params[:action] == route
	end
end
