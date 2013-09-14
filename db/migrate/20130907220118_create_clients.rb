class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :contact_email, null: false
      t.string :account_number, null: false
      t.text :address, null: true
    end
  end
end
