# == Schema Information
#
# Table name: people
#
#  id                     :integer          not null, primary key
#  given_name             :string(255)
#  family_name            :string(255)
#  family_relationship_id :integer
#  birthday               :date
#  education_level        :string(255)
#  gender                 :string(255)
#  in_school              :boolean
#  is_alive               :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  household_id           :integer
#

require 'spec_helper'

describe Person do
	before :each do 
		@json = {
			'person' => {
				'id' => 1,
				'given_name' => 'Vim',
				'family_name' => 'Wizard',
				'birthday' => '2014-10-21',
				'education_level' => 'some college',
				'gender' => 'male',
				'in_school' => true,
			}}
	end

	it 'creates a new person from a person json structure' do
		person = Person.new @json
		expect(person.id).to eq(@json['person']['id'])
		expect(person.given_name).to eq(@json['person']['given_name'])
		expect(person.family_name).to eq(@json['person']['family_name'])
		expect(person.birthday).to eq(@json['person']['birthday'])
		expect(person.education_level).to eq(@json['person']['education_level'])
		expect(person.gender).to eq(@json['person']['gender'])
		expect(person.in_school).to eq(@json['person']['in_school'])
	end
end
