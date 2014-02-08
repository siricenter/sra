class Person < ActiveRecord::Base
  attr_accessible :birthday, :education_level, :education_level, :family_name, :gender, :given_name, :in_school, :is_alive
  belongs_to :household
end
