# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'
require 'factory_girl'

describe Area do
	before :each do
		@json = { 'area' => {
			'id' => 1,
			'name' => 'Kyiv'
		} }
	end

	it 'creates an empty area' do
		area = Area.new
		expect(area.id).to be_nil
		expect(area.name).to be_nil
	end

	it 'turns an area json structure into an object' do
		area = Area.new @json
		expect(area.id).to eq(@json['area']['id'])
		expect(area.name).to eq(@json['area']['name'])
	end

	it 'lets us change the values' do
		area = Area.new
		area.id = 'id'
		area.name = 'name'

		expect(area.id).to eq('id')
		expect(area.name).to eq('name')
	end
end
