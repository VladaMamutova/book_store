class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :check_user

  def check_user
    @current_user = session[:login]
    @is_admin = session[:is_admin]
  end
end
