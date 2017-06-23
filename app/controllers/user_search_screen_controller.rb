class UserSearchScreenController

  def initialize(user_repository)
    @user_repository = user_repository
  end

  def next_controller(option)
    set_field_and_value(option)
    self
  end

  def render
    return render_users if field_and_value_set?
    return SearchValueScreenView.new.render if @search_field
    SearchFieldScreenView.new.render
  end


  private

  def field_and_value_set?
    @search_value && @search_field
  end

  def render_users
    users = @user_repository.find_by(@search_field.to_sym, @search_value)
    UserScreenView.new(users).render
  end

  def set_field_and_value(option)
    @search_value = option if @search_field
    @search_field = option unless @search_value
  end
end
