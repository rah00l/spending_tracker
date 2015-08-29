class AddCategoryIdToIncomeAndExpenses < ActiveRecord::Migration
  def change
  	add_column :incomes, :category_id, :integer
  	add_column :expenses, :category_id, :integer
  end
end
