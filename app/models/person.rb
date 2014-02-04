class Person
  include Mongoid::Document
  field :given_name, type: String
  field :family_name, type: String
  field :birthday, type: Date
  field :education_level, type: String
  field :gender, type: String
  field :in_school, type: Boolean
  field :arm_circumference, type: String
  field :is_alive, type: Boolean
  field :cause_death, type: String
end
