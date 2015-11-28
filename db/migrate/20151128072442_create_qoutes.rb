class CreateQoutes < ActiveRecord::Migration
  def change
    create_table :qoutes do |t|
      t.text :message
      t.integer :user_id
      t.string :qoute_by

      t.timestamps null: false
    end
  end
end
