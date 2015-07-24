module ApplicationHelper

	#display page titles
	def page_title(title)
       default_title = "Welcome to Africa's best online eBook store"
       if title.empty? then default_title else title + ' | ' + default_title end
	end
end
