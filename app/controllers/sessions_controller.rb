class SessionsController < ApplicationController
def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      puts 'here'
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user, jwt: token, success: "Welcome back, #{user.username}"}
    else
      render json: {errors: 'Invalid username or password!'}, status: :not_acceptable
    end
  end

  def auto_login
    if session_user
      puts 'autologin success'
      render json: session_user
    else
      render json: {errors: "No User Logged In"}
    end
  end

  def user_is_authed
    render json: {message: "You are authorized"}
  end
end
