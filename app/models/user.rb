# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < SraModel
	json_attributes :id,
		:email,
		:encrypted_password,
		:reset_password_token,
		:reset_password_sent_at,
		:remember_created_at,
		:sign_in_count,
		:current_sign_in_at,
		:last_sign_in_at,
		:current_sign_in_ip,
		:updated_at,
		:created_at,
		:last_sign_in_ip
	
end
