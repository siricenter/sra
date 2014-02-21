module HouseholdsHelper
	def households_grid households
		s = ""
		column = 3
		households.each do |household|
			column += 1
			if column > 3
				column = 1
				s << %{<div class="row">}
			end

			s << %{#{household_panel household}}

			if column == 3
				s << %{</div>}
			end
		end

		if column != 3
			s << %{</div>}
		end
		s.html_safe
	end

	def household_panel household
		s = <<-EOS
			<div class="col-sm-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">#{household.name}</h3>
					</div>
					<div class="panel-body">
						<p>
							"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ali qua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qu i officia deserunt mollit anim id est laborum."
						</p>
		#{link_to 'Show', household, class: [:btn, "btn-success", "btn-lg"]}
		#{link_to 'Edit', edit_household_path(household), class: [:btn, "btn-success", "btn-lg"]}
					</div>
				</div>
			</div>
		EOS
		s.html_safe
	end
end
