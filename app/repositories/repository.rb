module Repository

  def initialize(results)
    @results = results
  end

  def find_by(field, value)
    @results
        .select { |ticket| ticket[field].to_s == value }
        .map { |ticket_hash| self.class::MODEL_TYPE.new(ticket_hash) }
  end

end
