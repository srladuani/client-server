class Api::V1::BaseApiController < ApplicationController
  # before action, check if user is authenticated
  before_action :authenticate_request!
  
  attr_reader :current_user

  

  protected
    
    ## check if user is authenticated
    ## otherwise, return json of Not Authenticated
    def authenticate_request!
      unless user_id_in_token?
        render json: { errors: ['Not Authenticated'] }, status: :unauthorized
        return
      end
      @current_user = User.find(auth_token[:user_id])
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end

    private
      
      ## check Authorization token in headers
      ## and, get last part of token 
      def http_token
        @http_token ||= if request.headers['Authorization'].present?
          request.headers['Authorization'].split(' ').last
        end
      end

      ## decoding http token using JWT
      ## returns decoded token
      def auth_token
        @auth_token ||= JsonWebToken.decode(http_token)
      end

      ## check if user id in decoded token
      def user_id_in_token?
        http_token && auth_token && auth_token[:user_id].to_i
      end

end