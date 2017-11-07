class AddColumnsIsExecutedAndDaysToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :is_executed, :boolean,default: false
    add_column :tasks, :days, :integer,array: true
  end
end
