class CreateTransacts < ActiveRecord::Migration
  def change
    create_table :transacts do |t|
      t.integer :transactable_id
      t.string :transactable_type
      t.float :amount

      t.timestamps null: false
    end
  end
end
