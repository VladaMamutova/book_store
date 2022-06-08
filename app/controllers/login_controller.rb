class LoginController < ApplicationController
  def sign_in; end

  def sign_up; end

  def perform_sign_in
    user = UserAuthenticator.call(params, session)
    unless user
      @error = 'Неверный логин или пароль'
      render :sign_in and return
    end

    redirect_to :books
  end

  def perform_sign_up
    user = User.new(user_params)
    unless user.save
      @error = user.errors.full_messages.join(', ')
      render :sign_up and return
    end

    render :sign_in, status: :created
  end

  def sign_out
    session.delete(:login)
    session.delete(:is_admin)

    redirect_to :books
  end

  private

  def user_params
    {
      login: params[:login],
      is_admin: params[:is_admin],
      password: params[:password]
    }
  end
end
