class AddIndexToTasksUserId < ActiveRecord::Migration
  def change
    add_index :tasks, :user_id, :name=>'user_index'
  end
end
