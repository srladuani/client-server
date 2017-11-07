class Task < ApplicationRecord
  mount_uploader :path, TaskUploader
  validates :name,:start_time,:end_time,presence: true

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
