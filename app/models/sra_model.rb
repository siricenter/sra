class SraModel

	def initialize json = {}
		json_attributes @@attrs, json
	end

	def self.json_attributes *attributes
		@@attrs = attributes
		attributes.each do |attribute|
			attr_accessor attribute
		end
	end

	def json_attributes attrs, json
		name = self.class.name.downcase
		json = json[name] if json.include?(name)
		@@attrs.each do |attribute|
			attribute = attribute.to_s
			if json.include?(attribute)
				self.instance_variable_set("@#{attribute}", json[attribute])
			end
		end
	end
	
	def self.find id
		example = User.new({'id' => id})
		raise 'no id' unless example.id
		url = SraLib::resource_url(example)
		json = SraLib::get url
		instantiate(json)
	end
	
	def destroy
		url = SraLib::resource_url(self)
		api_response = SraLib::delete url
		json_structure = JSON.parse(api_response.body)
		success = json_structure['success'] if json_structure.include?('success')
		if success
			self.id = nil
			return :success
		end

		return :failure
	end

	def self.create json
		model = self.new(json)
		model.create
		return model
	end
	
	def create
		data = {}
		self.instance_variables.each do |variable|
			key = variable.to_s.delete(':@')
			data[key] = self.instance_variable_get(variable)
		end
		url = SraLib::resource_url(self)
		api_response = SraLib::post url, data
		json_structure = JSON.parse(api_response)
		self.id = json_structure['id'] if json_structure.include?('id')
		return self
	end
	
	def self.model_name
		self.class.name
	end
	
	private
	def self.instantiate json
		json_structure = JSON.parse(json)
		self.new(json_structure)
	end
end

	
end
