class SearchResultsView

  def initialize(results)
    @results = results
  end

  def render
    return "No Search Results Found\n" unless @results
    @results.map { |result| result_print(result) }.join("\n")
  end

  private
  def result_print(result)
    result.instance_variables.map do |ivar|
      var_value = result.instance_variable_get(ivar)
      label = "#{ivar[1...ivar.length]}:"
      if var_value.is_a?(Model)
        present_nested_model(label, var_value)
      else
        present_value(label, var_value)
      end
    end
  end

  def present_value(label, var_value)
    col_width = 30
    col_width - label.length
    "#{label.ljust(col_width)}#{var_value.to_s}"
  end

  def present_nested_model(label, var_value)
    label = "   #{label}\n"
    model_results = result_print(var_value)
                        .map { |result| "   #{result}" }
                        .join("\n")
    "#{label}#{model_results}"
  end

end
