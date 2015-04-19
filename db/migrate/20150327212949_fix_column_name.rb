class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :projects, :soft_dedline, :soft_deadline
  end
end
