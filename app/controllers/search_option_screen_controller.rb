class SearchOptionScreenController

  def initialize(search_screen_controllers)
    @search_screen_controllers = search_screen_controllers
  end

  def next_controller(option)
    @search_screen_controllers[option.to_i - 1] || self
  end

  def render
    SearchOptionScreenView.new.render
  end

end
