# == Schema Information
#
# Table name: people
#
#  id              :integer          not null, primary key
#  given_name      :string(255)
#  family_name     :string(255)
#  birthday        :date
#  education_level :string(255)
#  gender          :string(255)
#  in_school       :boolean
#  is_alive        :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  household_id    :integer
#

class Person < ActiveRecord::Base
  attr_accessible :birthday, :education_level, :education_level, :family_name, :gender, :given_name, :in_school, :is_alive
  belongs_to :household
end
