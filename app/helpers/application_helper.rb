module ApplicationHelper\

	def flash_message(type, text)
	    flash[type] ||= []
	    flash[type] << text
	end

	def render_flash
	  rendered = []
	  flash.each do |type, messages|
	    messages.each do |m|
	      rendered << render(:partial => 'partials/flash', :locals => {:type => type, :message => m}) unless m.blank?
	    end
	  end
	  rendered.join('<br/>')
	end

end
