class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :path

      t.timestamps
    end
  end
end
