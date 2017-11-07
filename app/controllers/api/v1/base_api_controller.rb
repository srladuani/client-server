class Api::V1::BaseApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  
end