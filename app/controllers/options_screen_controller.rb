class OptionsScreenController

  def initialize(splash_screen_options, view)
    @screen_options = splash_screen_options
    @view = view
  end

  def next_controller(option)
    option_index = option.to_i - 1
    raise InvalidInputError.new(option) unless valid_input?(option_index)
    @screen_options[option_index]
  end

  def render
    @view.render
  end

  private

  def valid_input?(option_index)
    option_index.between?(0, @screen_options.size)
  end
end
