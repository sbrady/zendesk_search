class User
  def initialize(json)
    json.each do |k, v|
      instance_variable_set("@#{k}", v)
      User.class_eval { attr_reader k.to_sym }
    end
  end
end
