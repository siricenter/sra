module InterviewsHelper
	def selection name, options, name_hash = "interview"
		select_string = "<select name=\"#{name_hash}[#{name}]\">\n"
		select_string += options(options)
		select_string += "</select>"
		select_string.html_safe
	end

	def options options
		option_string = ""
		options.each do |option|
			option_string += "<option value=#{option}>#{option.capitalize}</option>\n"
		end
		return option_string.html_safe
	end

	def nutrient_row label, amount, people
		row = <<-EOH
			<div class="row">
				<input disabled="true", value="#{amount / people}", class="textfield col-sm-1"/>
				<label class="col-sm-11">#{label} Per Person</label>
			</div>
		EOH
		
		row.html_safe
	end
end
