class SplashScreenController

  def initialize(splash_screen_options)
    @splash_screen_options = splash_screen_options
  end

  def next_controller(option)
    @splash_screen_options[option.to_i - 1] || self
  end

  def render
    SplashScreenView.new.render
  end

end
