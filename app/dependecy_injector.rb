module DependencyInjector

  def front_controller
    @front_controller ||= FrontController.new(splash_screen_controller)
  end

  def splash_screen_controller
    @splash_screen_controller ||= SplashScreenController.new(search_option_screen_controller)
  end

  def search_option_screen_controller
    @search_option_screen_controller ||= SearchOptionScreenController.new(user_search_screen_controller)
  end

  def user_search_screen_controller
    @user_search_screen_controller ||= UserSearchScreenController.new(user_repository)
  end

  def user_repository
    @user_repository ||= UserRepository.new(users)
  end

  def users
    @users ||= JsonParser.new(File.dirname(__FILE__)+'/../data/users.json').parse
  end
end
