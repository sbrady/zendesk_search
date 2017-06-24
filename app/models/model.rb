class Model
  def initialize(json)
    fields = json.map do |k, v|
      instance_variable_set("@#{k}", v)
      self.class.class_eval { attr_reader k.to_sym }
      k.to_sym
    end
    self.class.class_eval { @all_fields = fields }
  end

  class << self
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
