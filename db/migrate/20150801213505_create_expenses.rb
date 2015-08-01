class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :date_of_expense
      t.float :amount
      t.integer :account_id

      t.timestamps null: false
    end
  end
end
