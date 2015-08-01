class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
