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
end
