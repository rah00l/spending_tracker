class AddNoteToIncomeAndExpense < ActiveRecord::Migration
  def change
  	add_column :incomes, :note, :text
  	add_column :expenses, :note, :text
  end
end
