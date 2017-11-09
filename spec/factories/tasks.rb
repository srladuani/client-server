FactoryGirl.define do 
  factory :task do
    name "First Task"
    start_time "2017-11-06 19:49:48"
    end_time "2017-11-06 19:49:48"
    path "dir/path"
    days [0,1]
    user
  end
end
