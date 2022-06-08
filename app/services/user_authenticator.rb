class UserAuthenticator < ApplicationService
  def initialize(params, session)
    super()
    @login = params[:login]
    @password = params[:password]
    @session = session
  end

  def call
    authenticate
  end

  private

  attr_accessor :login, :password, :session

  def authenticate
    # The authenticate method can be available by putting
    # has_secure_password in the User model
    # to check if the user's password is correct.
    return unless user&.authenticate(password) # user or nil

    session[:login] = user.login
    session[:is_admin] = user.is_admin
    user
  end

  def user
    @user ||= User.find_by(login: login)
  end
end
