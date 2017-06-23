class UserRepository

  def initialize(users)
    @users = users
  end


  def find_by(field, value)
    @users
        .select { |user| user[field].to_s == value }
        .map { |user_hash| User.new(user_hash) }
  end

end
