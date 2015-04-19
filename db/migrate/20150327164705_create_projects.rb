class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :description
      t.boolean :active
      t.boolean :completed
      t.date :soft_deadline
      t.date :hard_deadline

      t.timestamps null: false
    end
  end
end
