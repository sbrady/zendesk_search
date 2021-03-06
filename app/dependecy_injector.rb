module DependencyInjector

  def initialize
    all_repositories
  end

  def front_controller
    @front_controller ||= FrontController.new(splash_screen_controller, ProgramEnder)
  end

  def splash_screen_options
    [search_option_screen_controller, searchable_fields_screen_controller]
  end

  def splash_screen_controller
    @splash_screen_controller ||= OptionsScreenController.new(splash_screen_options, splash_screen_view)
  end

  def splash_screen_view
    @splash_screen_view ||= SplashScreenView.new
  end

  def search_option_controllers
    [user_search_screen_controller, ticket_search_screen_controller, organizations_search_screen_controller]
  end

  def search_option_screen_controller
    @search_option_screen_controller ||= OptionsScreenController.new(search_option_controllers, search_option_screen_view)
  end

  def search_option_screen_view
    @search_option_screen_view ||= SearchOptionScreenView.new
  end

  def user_search_screen_controller
    @user_search_screen_controller ||= SearchScreenController.new(user_repository)
  end

  def ticket_search_screen_controller
    @ticket_search_screen_controller ||= SearchScreenController.new(ticket_repository)
  end

  def organizations_search_screen_controller
    @organizations_search_screen_controller ||= SearchScreenController.new(organization_repository)
  end

  def searchable_fields_screen_controller
    @searchable_fields_screen_controller ||= SearchableFieldsScreenController.new
  end

  def organization_repository
    @organization_repository ||= OrganizationRepository.new(organizations)
  end

  def user_repository
    @user_repository ||= UserRepository.new(users)
  end

  def ticket_repository
    @ticket_repository ||= TicketRepository.new(tickets)
  end

  def all_repositories
    unless @all_repositories
      @all_repositories = [organization_repository, user_repository, ticket_repository]
      @all_repositories.each { |repository| repository.repositories=all_repositories }
    end
    @all_repositories
  end

  def users
    @users ||= JsonParser.new(File.dirname(__FILE__)+'/../data/users.json').parse
  end

  def tickets
    @tickets ||= JsonParser.new(File.dirname(__FILE__)+'/../data/tickets.json').parse
  end

  def organizations
    @organizations ||= JsonParser.new(File.dirname(__FILE__)+'/../data/organizations.json').parse
  end
end
