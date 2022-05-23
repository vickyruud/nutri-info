class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.password == user.password_confirmation
      if user.save
        token = issue_token(user)
        render json: { valid: "true", user: {id: user.id, username: user.username}, token: token}
      else
        render json: { valid: "false", errorMessages: user.errors.messages }
      end
    else
      render json: { valid: "false", errorMessages: "Passwords do not match" }
    end
  end

  private

  def user_params
    params.permit(:username, :password, :email, :password_confirmation)
  end


end
