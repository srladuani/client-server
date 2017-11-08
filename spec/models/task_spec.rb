require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is not valid without attributes" do
    task = Task.new
    expect(task).to_not be_valid
  end

  it "is valid with a attributes" do
    task = FactoryGirl.create(:task)
    expect(task).to be_valid
  end
end
