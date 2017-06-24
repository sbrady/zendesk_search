class Model

  def initialize(json)
    fields = json.map do |k, v|
      instance_variable_set("@#{k}", v)
      self.class.class_eval { attr_reader k.to_sym }
      k.to_sym
    end

    self.class.nested_fields.each do |nested|
      instance_variable_set("@#{nested[2]}", nil)
      self.class.class_eval { attr_accessor nested[2].to_sym }
    end

    self.class.class_eval { @all_fields = fields }
  end

  class << self

    def has(object_type, via)
      setter_name = via[:via].to_s.downcase.split('_')[0]
      self.class_variable_set(:@@_nested, []) unless self.class_variable_defined?(:@@_nested)
      self.class_variable_set(:@@_nested, self.class_variable_get(:@@_nested) << [object_type, via[:via], setter_name])
    end

    def nested_fields
      self.class_variable_defined?(:@@_nested) ? self.class_variable_get(:@@_nested) : []
    end

    def all_child_fields
      descendants
          .map { |descendant| {descendant.to_s => descendant.all_fields} }
          .reduce { |d1, d2| d1.merge(d2) }
    end

    def descendants
      ObjectSpace.each_object(Class).select { |k| k < self }
    end

    def all_fields
      @all_fields
    end
  end

end
