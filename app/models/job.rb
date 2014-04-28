class Job < ActiveRecord::Base
	attr_accessible :description, :seasonal, :title, :occupation
	belongs_to :person
	belongs_to :occupation

	validates_presence_of :person
	validates_presence_of :occupation
end
