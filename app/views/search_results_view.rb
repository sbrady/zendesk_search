class SearchResultsView

  def initialize(results)
    @results = results
  end

  def render
    @results.map { |result| result_print(result) }.join("\n")
  end

  private
  def result_print(result)
    result.instance_variables.map do |ivar|
      "#{ivar[1...ivar.length]}:#{result.instance_variable_get(ivar).to_s.rjust(20)}"
    end
  end

end
