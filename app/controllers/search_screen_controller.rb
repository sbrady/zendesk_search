class SearchScreenController

  def initialize(repository)
    @repository = repository
  end

  def next_controller(option)
    set_field_and_value(option)
    self
  end

  def render
    return render_results if field_and_value_set?
    return SearchValueScreenView.new.render if @search_field
    SearchFieldScreenView.new.render
  end


  private

  def field_and_value_set?
    @search_value && @search_field
  end

  def render_results
    results = @repository.find_by(@search_field.to_sym, @search_value)
    SearchResultsView.new(results).render
  end

  def set_field_and_value(option)
    @search_value = option if @search_field
    @search_field = option unless @search_value
  end
end
