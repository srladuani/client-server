class Task < ApplicationRecord
  
  #associations
  belongs_to :user

  # required fields validation
  validates :name,:start_time,:end_time,:path,presence: true

  # selected days are array of integers
  # it will retrieve day names of selected days
  def scheduled_days
    day_names = []
    if days.any?
      days.each do |index|
        day_names << Date::DAYNAMES[index]
      end
    end
    day_names
  end
end
