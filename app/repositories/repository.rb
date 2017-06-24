module Repository

  def initialize(results)
    @results = results.map { |result_hash| self.class::MODEL_TYPE.new(result_hash) }
  end

  def find_by(field, value)
    @results
        .select { |result| result.send(field).to_s == value }
  end

end
