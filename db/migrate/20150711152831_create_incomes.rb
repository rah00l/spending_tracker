class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.date :date_of_income
      t.float :amount

      t.timestamps null: false
    end
  end
end
