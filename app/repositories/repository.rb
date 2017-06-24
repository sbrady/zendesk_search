module Repository

  def initialize(results)
    @results = results.map do |result_hash|
       self.class::MODEL_TYPE.new(result_hash)
    end
    set_up_results_map
  end

  def repositories=(repositories)
    @repositories = repositories
    @results = @results.map do |model|
      hydrate_related_objects!(model) if related_objects?
      model
    end
  end

  def find_by(field, value)
    @results_map[field][value.to_s]
  end

  private

  def related_objects?
    self.class::MODEL_TYPE.class_variable_defined?(:@@_nested)
  end

  def related_objects
    self.class::MODEL_TYPE.class_variable_get(:@@_nested)
  end

  def hydrate_related_objects!(model)
    related_objects.each do |relationship|
      repository = find_repository_by_type(relationship[0])
      related_objects = repository.find_by(:_id, model.send(relationship[1]))
      if related_objects
        related_object = related_objects.first
      end
      model.send("#{relationship[2]}=", related_object)
    end
    model
  end

  def find_repository_by_type(model_type)
    @repositories.find { |repository| repository.class::MODEL_TYPE == model_type }
  end

  def set_up_results_map
    @results_map = {}
    self.class::MODEL_TYPE.all_fields.each do |field|
      @results_map[field] = all_values_for(field)
                                .map{|value| {value => slow_find_by(field, value) }}
                                .reduce{|a,b|a.merge(b)}
    end
  end

  def all_values_for(field)
    @results.map{|result| result.send(field).to_s}
  end

  def slow_find_by(field, value)
    @results
        .select { |result| result.send(field).to_s == value.to_s }
  end

end
