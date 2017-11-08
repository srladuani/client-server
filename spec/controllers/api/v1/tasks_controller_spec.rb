require "spec_helper"  
describe Api::V1::TasksController , :type => :api do

  it "making a request without token" do
    get "/api/v1/tasks",nil, {'HTTP_ACCEPT' => "application/json"}
    
    expect(last_response.status).to eq 401
    
    errors = {
      "errors": [
        "Not Authenticated"
      ]
    }
    expect(last_response.body).to eq(errors.to_json)
  end
  
  # task index action
  context :index do
    before do
      # authenticate user
      authenticate_as_a_valid_user
      # creating a task
      task = FactoryGirl.create(:task)
      
      # set token in header
      header 'Authorization',@auth_token
      
      get "/api/v1/tasks",nil, {'HTTP_ACCEPT' => "application/json"}
    end
    
    it 'responds with status 200' do
      expect(last_response.status).to eq 200
    end

    it 'responds with array of json of size 1' do
      expect(json.size).to eq 1
    end
    
    it 'responds with array of tasks with task name First Task' do
      # first task
      @task =  json[0]
      puts "name: #{@task['name']}"
      expect(@task['name']).to eq 'First Task'
    end

  end
end  