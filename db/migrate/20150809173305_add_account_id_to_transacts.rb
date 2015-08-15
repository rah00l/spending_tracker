class AddAccountIdToTransacts < ActiveRecord::Migration
  def change
    add_column :transacts, :account_id, :integer
  end
end
