class CreateWorkLogs < ActiveRecord::Migration
  def change
    create_table :work_logs do |t|
      t.integer :project_id, null: false
      t.decimal :hours, null: false
      t.text :comment, null: false
      t.date :day, null: false
    end
  end
end
