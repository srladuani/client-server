module AuthenticationHelper
  def authenticate_as_a_valid_user
      @user ||= FactoryGirl.create(:user)
      post "/auth_user",{email: 'test@example.com',password: 'please123'}, {'HTTP_ACCEPT' => "application/json"}
      @auth_token = json['auth_token']
    end
end

RSpec.configure do |config|
  config.include AuthenticationHelper, :type=>:api
end