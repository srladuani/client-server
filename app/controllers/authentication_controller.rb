class AuthenticationController < ApplicationController
  # skip token authenticity during authenticate user
  skip_before_action :verify_authenticity_token,only: :authenticate_user

  ## authenticate user with valid email & password
  ## returns user payload with auth token if valid email/password
  ## Otherwise, return error 'Invalid Username/Password' in json format
  
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])
    if user and user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  # returns user payload with encrypted auth token.
  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end