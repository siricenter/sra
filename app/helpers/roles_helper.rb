module RolesHelper
	def permission_panel permission, assign = true
		panel = <<-EOH
		<div class="col-sm-6 col-md-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">#{permission.name}</h3>
				</div>
				<div class="panel-body index">
		#{ if assign then link_to 'Assign', new_role_permission_path(@role.id, permission.id), class: [:btn, "btn-success", "btn-lg", "col-sm-12"], id: "#{permission.id}_assign", method: :post end}
		#{ unless assign or permission.name == "public" then link_to 'Unassign', destroy_role_permission_path(@role.id, permission.id), class: [:btn, "btn-success", "btn-lg", "col-sm-12"], id: "#{permission.id}_unassign", method: :delete end}
				</div>
			</div>
		</div>
		EOH
		panel.html_safe
	end
end
