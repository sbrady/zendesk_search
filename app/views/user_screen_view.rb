class UserScreenView

  def initialize(users)
    @users = users
  end

  def render
    @users.map { |user| user_print(user) }.join("\n")
  end

  private
  def user_print(user)
    <<-SPLASH
id:    #{user._id}
name:    #{user.name}
    SPLASH
  end

end
