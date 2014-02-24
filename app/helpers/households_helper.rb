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

			s << %{#{household_panel household, 4}}

			if column == 3
				s << %{</div>}
			end
		end

		if column != 3
			s << %{</div>}
		end
		s.html_safe
	end

	def household_panel household, size
		s = <<-EOS
			<div class="col-sm-#{size}">
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

	def grid columns, &block
		grid = Grid.new columns
		body = capture(grid, &block)
		body << "</div>".html_safe unless grid.current_column == columns
		body.html_safe
	end

	class Grid
		include ActionView::Helpers::TagHelper
		attr_reader :current_column
		def initialize columns = 3
			@column_count = columns
			@current_column = columns
		end

		def panel_head heading
			@current_column += 1
			if @current_column > @column_count
				@current_column = 1
			end
			head = %{
				<div class="col-sm-4">
				<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
			#{heading}
			 </h3>
				</div>
			}
			head = %{<div class="row">} << head if @current_column == 1
			#debugger
			head.html_safe
		end

		def panel_body output #&block2
			#raise "Needs a block" unless block_given?
			#debugger
			#output = capture(self, &block2)
			content = content_tag(:div, content_tag(:p, output), class: "panel-body")
			content << "</div> </div>".html_safe
			content << "</div>".html_safe if @current_column == @column_count
			content.html_safe
		end

		def panel_clean

		end
	end
end
