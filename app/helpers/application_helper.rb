module ApplicationHelper
	def activeMenu?(activePaths, method)
		activePaths.include?(method) 
	end
end
