module UsersHelper
	def role_panel role, assign = true
		panel = <<-EOH
		<div class="col-sm-6 col-md-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">#{role.name}</h3>
				</div>
				<div class="panel-body index">
		#{ if assign then link_to 'Assign', new_user_role_path(@user.id, role.id), class: [:btn, "btn-success", "btn-lg", "col-sm-12"], id: "#{role.name}_assign", method: :post end}
		#{ unless assign or role.name == "public" then link_to 'Unassign', destroy_user_role_path(@user.id, role.id), class: [:btn, "btn-success", "btn-lg", "col-sm-12"], id: "#{role.name}_unassign", method: :delete end}
				</div>
			</div>
		</div>
		EOH
		panel.html_safe
	end
end
