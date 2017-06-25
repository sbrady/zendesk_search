class InvalidInputError < RuntimeError

  def initialize(option)
    super("#{option} is not valid a option")
  end

end