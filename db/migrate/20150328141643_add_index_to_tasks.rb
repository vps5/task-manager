class AddIndexToTasks < ActiveRecord::Migration
  def change
    add_index :tasks, :project_id, :name=>'project_index'
  end
end
