class SearchOptionScreenController

  def initialize(user_search_screen_controller)
    @user_search_screen_controller = user_search_screen_controller
  end

  def next_controller(option)
    return @user_search_screen_controller if option == '1'
    self
  end

  def render
    SearchOptionScreenView.new.render
  end

end
