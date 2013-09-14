class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :client_id, null: false
      t.string :name, null: false
      t.decimal :budget_hours, null: true
      t.date :deadline, null: true
    end
  end
end
