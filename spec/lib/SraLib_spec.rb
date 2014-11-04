require 'sra_lib'

describe SraLib do
	describe '#api_url' do
		it "returns the url for the API server" do
			expect(SraLib::api_url).to eq("http://sra-api.herokuapp.com")
		end
	end

	describe '#base_url' do
		it 'returns the path to the given resource' do
			user = User.new
			user.id = 1
			expect(SraLib::base_url(user)).to eq("http://sra-api.herokuapp.com/users")
		end
	end

	describe '#resource_url' do
		it 'returns the path to the given object' do
			user = User.new
			user.id = 1
			expect(SraLib::resource_url(user)).to eq("http://sra-api.herokuapp.com/users/1")
		end

		it 'returns the path to the resource so we can post the uncreated object' do
			expect(SraLib::resource_url(User.new)).to eq("http://sra-api.herokuapp.com/users")
		end
	end

	describe '#get' do
		it 'retrieves the json representation of an object from the api server' do
			user_json = {'user' => {
				'first_name' => Faker::Name.first_name, 
				'last_name' => Faker::Name.last_name,
				'email' => Faker::Internet.email,
				'password' => Faker::Internet.password }}
			stub_request(:get, /sra-api.herokuapp.com\/users\/1/).to_return(status: 200, body: user_json.to_json, headers: {})
			uri = 'https://sra-api.herokuapp.com/users/1'
			response = SraLib::get(uri)
			json_structure = JSON.parse(response.body)
			expect(json_structure).to eq(user_json)
		end
	end

	describe '#post' do
		it 'returns a json object containing the ID of the posted object' do
			json_response = {'id' => 5}
			stub_request(:post, /sra-api.herokuapp.com\/users/).to_return(status: 200, body: json_response.to_json, headers: {})
			uri = 'https://sra-api.herokuapp.com/users'
			params = {user: {
				email: Faker::Internet.email,
				password: Faker::Internet.password}}
			response = SraLib::post(uri, params)
			json_structure = JSON.parse(response.body)
			expect(json_structure).to eq(json_response)
		end
	end

	describe '#put' do
		it 'returns a notification that the update was successful' do
			json_response = {'success' => true}
			stub_request(:put, /sra-api.herokuapp.com\/users\/1/).to_return(status: 200, body: json_response.to_json, headers: {})
			uri = 'https://sra-api.herokuapp.com/users/1'
			params = {user: {
				email: Faker::Internet.email,
				password: Faker::Internet.password}}
			response = SraLib::put(uri, params)
			json_structure = JSON.parse(response.body)
			expect(json_structure).to eq(json_response)
		end
	end

	describe '#delete' do
		it 'returns a notification the the deletion was successful' do
			json_response = {'success' => true}
			stub_request(:delete, /sra-api.herokuapp.com\/users\/1/).to_return(status: 200, body: json_response.to_json, headers: {})
			uri = 'https://sra-api.herokuapp.com/users/1'
			response = SraLib::delete(uri)
			json_structure = JSON.parse(response.body)
			expect(json_structure).to eq(json_response)
		end
	end
end