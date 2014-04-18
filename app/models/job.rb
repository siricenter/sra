class Job < ActiveRecord::Base
	attr_accessible :description, :seasonal, :title, :occupation
	belongs_to :person
	belongs_to :occupation
end
