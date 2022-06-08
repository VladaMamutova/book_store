class ApplicationController < ActionController::Base
  before_action :check_user

  def check_user
    @current_user = session[:login]
    @is_admin = session[:is_admin]
  end
end
