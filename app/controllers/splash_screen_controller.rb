class SplashScreenController

  def initialize(search_option_screen_controller)
    @search_option_screen_controller = search_option_screen_controller
  end

  def next_controller(option)
    return @search_option_screen_controller if option == '1'
    self
  end


  def render
    SplashScreenView.new.render
  end

end
