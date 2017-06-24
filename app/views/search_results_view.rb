class SearchResultsView

  def initialize(results)
    @results = results
  end

  def render
    @results.map { |result| result_print(result) }.join("\n\n")
  end

  private
  def result_print(result)
    result.instance_variables.map do |ivar|
      var_value = result.instance_variable_get(ivar)
      if var_value.is_a?(Model)
        "#{ivar[1...ivar.length]}:\n"+result_print(var_value).join("\n")
      else
        "#{ivar[1...ivar.length]}:#{var_value.to_s.rjust(20)}"
      end
    end
  end

end
