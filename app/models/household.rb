# == Schema Information
#
# Table name: households
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Household < ActiveRecord::Base
	attr_accessible :name
	has_many :people
	belongs_to :user
	accepts_nested_attributes_for :people
	validates :name, 
		presence: true,
		format: { with: /\A[a-zA-Z' ]+\z/ }
	validates_presence_of :user
end
